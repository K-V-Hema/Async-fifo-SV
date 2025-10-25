class wr_cov;
wr_tx tx;
covergroup cg;
	coverpoint tx.wr_en{
		bins WRITES={1'b1};
		}
endgroup
function new();
	cg=new();
endfunction
	task run();
	forever begin
		tx=new();
		fifo_common::wr_mon2cov.get(tx);
		cg.sample();
		//tx.print("wr_cov");
	end
	endtask
endclass
