module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;
	//parameter A=1'b0001, B=1'b0010, C=1'b0100, D=1'b1000;

    // State transition logic: Derive an equation for each state flip-flop.
    
    assign next_state[A] = (state[C]&(~in))|(state[A]&(~in));
    
    assign next_state[B] = ((state[A]&(in))|(state[B]&(in))|(state[D]&(in)));

    assign next_state[C] = (state[B]&(~in))|(state[D]&(~in));
                                            
    assign next_state[D] = (state[C]&(in));
    // Output logic: 
    //assign out = (state==D)?1:0;  
    /*always @(*)
        begin
            if ((state != D))
                out = 0;
            else
                out = 1;
        end
	*/
	assign out = state[D];
endmodule
