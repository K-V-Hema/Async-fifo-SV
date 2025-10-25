class wr_tx;
	rand bit wr_en;
	randc bit [`WIDTH-1:0]wdata;
		bit full;
		bit overflow;
	
	function void print(input string str);
		$display("%0t:-----------%0s---------",$time,str);
		$display("wr_en=%0b",wr_en);
		$display("wdata=%0d",wdata);
		$display("full=%0b",full);
		$display("overflow=%0b",overflow);
	endfunction
endclass
