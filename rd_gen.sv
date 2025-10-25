class rd_gen;
	rd_tx tx;
	int rd_delay=3;
	task run();
	case(fifo_common::test_name)
		"FULL": begin
		end
		"EMPTY": begin
			wait(fifo_common::wrgen_count==fifo_common::wrbfm_count);
			reads(`FIFO_SIZE);
		end
		"OVERFLOW": begin
		end
		"UNDERFLOW": begin
			wait(fifo_common::wrgen_count==fifo_common::wrbfm_count);
			reads(`FIFO_SIZE+1);
		end
		"CONCURRENT": begin
			reads(`FIFO_SIZE);
		//	rd_delay=$urandom_range(10,15);
			#(rd_delay);
		end
	endcase
	endtask
task reads(input int n);
	repeat(n) begin
		tx=new();
		assert (tx.randomize() with {tx.rd_en==1;});
	//	tx.print("rd_gen");
		fifo_common::rd_gen2bfm.put(tx);
	end
endtask
endclass
