interface fifo_intrf(input wr_clk,rd_clk,res);
	bit wr_en;
	bit rd_en;
	bit[`WIDTH-1:0]wdata;
	bit[`WIDTH-1:0]rdata;
	bit empty,full,overflow,underflow;

	clocking wr_bfm_cb @(posedge wr_clk);
		default input #0  output #1;
		input full,overflow;
		output wr_en,wdata;
	endclocking
	
	clocking rd_bfm_cb @(posedge rd_clk);
		default input #0  output #1;
		input empty,rdata,underflow;
		output rd_en;
	endclocking

	clocking wr_mon_cb @(posedge wr_clk);
		default input #1;
		input wr_en,wdata,full,overflow;
	endclocking

	clocking rd_mon_cb @(posedge rd_clk);
		default input #1;
		input rd_en,rdata,empty,underflow;
	endclocking

endinterface
