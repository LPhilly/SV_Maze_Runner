module controller (
	
input logic [1:0] level_select, 
input logic level_lock, 
input logic clk, 
input logic KEY0,



output logic [3:0] red,
output logic [3:0] green,
output logic [3:0] blue 

);

logic ACCELEROMETER = 1;  // REPLACE THIS WITH THE ACTUAL ACCELEROMETER INPUT

typedef enum logic [1:0] {init, level_selection, gameplay} state; 
state current_state, next_state;

typedef enum logic [1:0] {game_init, move, still, finish} gameplay_state; 
gameplay_state current_gameplay, next_gameplay; 


always_ff @ (posedge clk) begin 
	current_state <= next_state;
	current_gameplay <= next_gameplay;
end 

always_comb 
	case (current_state)
		init: begin
		
					if (level_select != 2'b00) begin
						next_state <= level_selection;
					end
					else
						next_state <= init;
				next_gameplay <= current_gameplay;
				end
		level_selection: begin
									
										if (!level_lock) begin
											next_state <= level_selection;
										end
										else
											next_state <= gameplay;
									next_gameplay <= current_gameplay;
							  end
		gameplay: begin
						case (current_gameplay)
						game_init : begin
										
											if (ACCELEROMETER) 
												next_gameplay <= move; 
											else 
												next_gameplay <= game_init;
										end
						move : begin
										
										if (1) // FINISH POSITION
											next_gameplay <= finish; 
										else if (1) // COLLISION 
											next_gameplay <= game_init;
										else if (ACCELEROMETER) 
											next_gameplay <= move; 
										else if (!ACCELEROMETER) 
											next_gameplay <= still; 
												
								
								 end
								 
						still : begin 
									
										if (1) // FINISH POSITION
											next_gameplay <= finish; 
										else if (1) // COLLISION 
											next_gameplay <= game_init;
										else if (ACCELEROMETER) 
											next_gameplay <= move; 
										else if (!ACCELEROMETER) 
											next_gameplay <= still; 
								  
								  end
								  
						finish : begin
									
									if (!KEY0)
										next_gameplay <= game_init; 
									else 
										next_gameplay <= finish; 
									
									end
						endcase
						
						
						
						
						
						if (level_lock) 
							next_state <= gameplay; 
						else
							next_state <= level_selection;
					 end
	endcase
endmodule 
