// Positive edge detector (Moore)

module posdetectmoore
						(
						input clk,reset_n,x,
						output y
						);
						
						reg[1:0] next_state,present_state;
						
						//states
						
						localparam s0=0,s1=1,s2=2;
						
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
										next_state = s2;
									 else
										next_state = s0;
										
								s2: if (x)
										next_state = s2;
									 else
										next_state = s0;
										
								default: next_state = present_state;
							endcase
						end
						
					  //output
					  
					  assign y = (present_state == s1);
endmodule 