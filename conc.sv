program testcase;
	wr_gen wg;
	rd_gen rg;

	initial begin
		wg=new();
		rg=new();
	fork
		wg.run();
		rg.run();
	join
	end
endprogram
