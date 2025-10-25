class rd_mon;
rd_tx tx;
virtual fifo_intrf vif;
	task run();
		vif=tb.pif;
		forever begin
		@(vif.rd_mon_cb);
		tx=new();
		if(vif.rd_mon_cb.rd_en==1) begin
		tx.rd_en=vif.rd_mon_cb.rd_en;
		wait(vif.rd_mon_cb.rdata!=0);
		tx.rdata=vif.rd_mon_cb.rdata;
		tx.empty=vif.rd_mon_cb.empty;
		tx.underflow=vif.rd_mon_cb.underflow;
		fifo_common::rd_mon2cov.put(tx);
		fifo_common::rd_mon2sbd.put(tx);
		tx.print("rd_mon");
		end
		end
	endtask
endclass
