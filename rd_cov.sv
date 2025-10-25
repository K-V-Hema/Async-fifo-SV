class rd_cov;
rd_tx tx;
covergroup cg;
	coverpoint tx.rd_en{
		bins READS={1'b1};
		}
endgroup
function new();
	cg=new();
endfunction

	task run();
	forever begin
		tx=new();
		fifo_common::rd_mon2cov.get(tx);
		cg.sample();
		tx.print("rd_cov");
	end
	endtask
endclass
