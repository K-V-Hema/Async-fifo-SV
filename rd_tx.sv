class rd_tx;
	rand bit rd_en;
	randc bit [`WIDTH-1:0]rdata;
		bit empty;
		bit underflow;
	
	function void print(input string str);
	$display("%0t:----------%0s--------",$time,str);
	$display("rd_en=%0b",rd_en);
	$display("rdata=%0d",rdata);
	$display("empty=%0b",empty);
	$display("underflow=%0b",underflow);
	endfunction
endclass
