class wr_gen;
	wr_tx tx;
	int wr_delay=2;
	task run();
	case(fifo_common::test_name)
		"FULL": begin
			writes(`FIFO_SIZE);
		end
		"EMPTY": begin
			fifo_common::wrgen_count=`FIFO_SIZE;
			writes(`FIFO_SIZE);
		end
		"OVERFLOW": begin
			writes(`FIFO_SIZE+1);
		end
		"UNDERFLOW": begin
			fifo_common::wrgen_count=`FIFO_SIZE;
			writes(`FIFO_SIZE);
		end
		"CONCURRENT": begin
				writes(`FIFO_SIZE);
			//wr_delay=$urandom_range(5,10);
			#(wr_delay);
		end
		default $display("test_failed");
	endcase
	endtask
task writes(input int n);
	repeat(n) begin
		tx=new();
		assert (tx.randomize() with {tx.wr_en==1;});
	//	tx.print("wr_gen");
		fifo_common::wr_gen2bfm.put(tx);
	end
endtask
endclass
