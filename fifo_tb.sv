module tb;
	reg wr_clk,rd_clk,res;
	fifo_env env;
	fifo_intrf pif(wr_clk,rd_clk,res);

async_fifo dut(.res(pif.res),
				.wr_en(pif.wr_en),
				.rd_en(pif.rd_en),
				.rdata(pif.rdata),
				.wdata(pif.wdata),
				.full(pif.full),
				.empty(pif.empty),
				.overflow(pif.overflow),
				.underflow(pif.underflow),
				.wr_clk(pif.wr_clk),
				.rd_clk(pif.rd_clk));

	always #2 wr_clk=~wr_clk;
	always #5 rd_clk=~rd_clk;

	initial begin
		wr_clk=0;
		rd_clk=0;
		res=1;
		repeat(2) @(posedge wr_clk);
		res=0;
		env=new();
		env.run();
	end
	initial begin
		#800;
		if(fifo_common::matchings!=0 && fifo_common::mismatchings==0) begin
			$display("test_passed");
			$display("matchings=%0d,mismatchings=%0d",fifo_common::matchings,fifo_common::mismatchings);
		end
		else begin
			$display("test_failed");
			$display("matchings=%0d,mismatchings=%0d",fifo_common::matchings,fifo_common::mismatchings);
		end
		$finish;
	end
endmodule
