class fifo_env;
	wr_agent wr;
	rd_agent rd;
	fifo_sbd sbd;

	task run();
	wr=new();
	rd=new();
	sbd=new();
		fork
			wr.run();
			rd.run();
			sbd.run();
		join
	endtask
endclass
