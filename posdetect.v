// Positive edge detector (Mealy)

module posdetectmealy
						(
						input clk,reset_n,x,
						output y
						);
						
						reg next_state,present_state;
						
						//states
						
						localparam s0=0,s1=1;
						
						//present state
						
						always @(posedge clk,negedge reset_n)
						begin
							if(~reset_n)
								present_state <= s0;
							else
								present_state <= next_state;
						end
						
						//next state
						
						always @(*)
						begin
							case (present_state)
								s0: if (x)
										next_state = s1;
									 else
										next_state = s0;
								
								s1: if (x)
										next_state = s1;
									 else
										next_state = s0;
										
								default: next_state = present_state;
							endcase
						end
						
					  //output
					  
					  assign y = (present_state == s0) & x;
endmodule 