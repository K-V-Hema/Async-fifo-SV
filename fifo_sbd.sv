class fifo_sbd;
wr_tx wt;
rd_tx rt;
int que[$];
int value;
	task run();
	forever begin
		wt=new();
		rt=new();
		fifo_common::wr_mon2sbd.get(wt);
		fifo_common::rd_mon2sbd.get(rt);
		if(wt.wr_en==1) begin
			que.push_back(wt.wdata);
		end
		if(rt.rd_en==1) begin
			value=que.pop_front();
			if(value==rt.rdata) fifo_common::matchings++;
			else fifo_common::mismatchings++;
		end
	wt.print("sbd wr");
	rt.print("sbd rd");
	end
	endtask
endclass
