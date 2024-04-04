module controller (
	
input logic [1:0] level_select, 
input logic level_lock, 
input logic pixel_clk, 
input logic KEY0,
input [9:0]  col,
input [8:0]  row,
input [3:0] switches, 



output logic [3:0] red,
output logic [3:0] green,
output logic [3:0] blue 

);

logic ACCELEROMETER = 1;  // REPLACE THIS WITH THE ACTUAL ACCELEROMETER INPUT
logic clk;
logic [1:0] level;
logic [1:0] next_level;
logic withinAnyRectangle1;
logic withinAnyRectangle3;
logic withinAnyRectangle2;
	
typedef enum logic [1:0] {init, level_selection, gameplay} state; 
state current_state, next_state;

typedef enum logic [1:0] {game_init, move} gameplay_state; 
gameplay_state current_gameplay, next_gameplay; 


FastClock(pixel_clk,clk);

// ________________ LEVEL 1 

//Rectangle 1
logic [9:0] rect_x11 = 100;
logic [8:0] rect_y11 = 100;
logic [9:0] rect_width11 = 50;
logic [9:0] rect_height11 = 380;

//Rectangle 2
logic [9:0] rect_x21 = 150;
logic [8:0] rect_y21 = 100;
logic [9:0] rect_width21 = 150;
logic [9:0] rect_height21 = 50;

//Rectangle 3
logic [9:0] rect_x31 = 300;
logic [8:0] rect_y31 = 100;
logic [9:0] rect_width31 = 50;
logic [9:0] rect_height31 = 380;

//Rectangle 4
logic [9:0] rect_x41 = 350;
logic [8:0] rect_y41 = 350;
logic [9:0] rect_width41 = 150;
logic [9:0] rect_height41 = 130;

//Rectangle 5
logic [9:0] rect_x51 = 500;
logic [8:0] rect_y51 = 0;
logic [9:0] rect_width51 = 140;
logic [9:0] rect_height51 = 480;

//Start Rectangle
logic [9:0] rect_x61 = 100;
logic [8:0] rect_y61 = 430;
logic [9:0] rect_width61 = 50;
logic [9:0] rect_height61 = 50;

//Finish Rectangle
logic [9:0] rect_x71 = 500;
logic [8:0] rect_y71 = 0;
logic [9:0] rect_width71 = 140;
logic [9:0] rect_height71 = 50;

//Player
logic [9:0] playerX1 = 113;
logic [9:0] playery1 = 443;
logic [9:0] playerWidth1 = 25;
logic [9:0] playerHeight1 = 25;


//_____________________________________ LEVEL 2
//Rectangle 1
logic [9:0] rect_x12 = 20;
logic [8:0] rect_y12 = 100;
logic [9:0] rect_width12 = 50;
logic [9:0] rect_height12 = 380;

//Rectangle 2
logic [9:0] rect_x22 = 20;
logic [8:0] rect_y22 = 50;
logic [9:0] rect_width22 = 130;
logic [9:0] rect_height22 = 50;

//Rectangle 3
logic [9:0] rect_x32 = 100;
logic [8:0] rect_y32 = 100;
logic [9:0] rect_width32 = 50;
logic [9:0] rect_height32 = 350;

//Rectangle 4
logic [9:0] rect_x42 = 120;
logic [8:0] rect_y42 = 400;
logic [9:0] rect_width42 = 430;
logic [9:0] rect_height42 = 50;

//Rectangle 5
logic [9:0] rect_x52 = 500;
logic [8:0] rect_y52 = 100;
logic [9:0] rect_width52 = 50;
logic [9:0] rect_height52 = 300;

//Rectangle 6
logic [9:0] rect_x62 = 370;
logic [8:0] rect_y62 = 100;
logic [9:0] rect_width62 = 130;
logic [9:0] rect_height62 = 50;

//Rectangle 7
logic [9:0] rect_x72 = 320;
logic [8:0] rect_y72 = 100;
logic [9:0] rect_width72 = 50;
logic [9:0] rect_height72 = 170;

//Rectangle 8
logic [9:0] rect_x82 = 190;
logic [8:0] rect_y82 = 220;
logic [9:0] rect_width82 = 130;
logic [9:0] rect_height82 = 50;

//Rectangle 9
logic [9:0] rect_x92 = 190;
logic [8:0] rect_y92 = 30;
logic [9:0] rect_width92 = 50;
logic [9:0] rect_height92 = 190;

//Rectangle 10
logic [9:0] rect_x102 = 190;
logic [8:0] rect_y102 = 30;
logic [9:0] rect_width102 = 450;
logic [9:0] rect_height102 = 50;

//Rectangle 11
logic [9:0] rect_x112 = 590;
logic [8:0] rect_y112 = 55;
logic [9:0] rect_width112 = 50;
logic [9:0] rect_height112 = 425;

//Finish_Rectangle
logic [9:0] rect_x122 = 590;
logic [8:0] rect_y122 = 430;
logic [9:0] rect_width122 = 50;
logic [9:0] rect_height122 = 50;

//Start_Rectangle
logic [9:0] rect_x132 = 20;
logic [8:0] rect_y132 = 430;
logic [9:0] rect_width132 = 50;
logic [9:0] rect_height132 = 50;

//Player
logic [9:0] playerX2 = 33;
logic [9:0] playery2 = 443;
logic [9:0] playerWidth2 = 25;
logic [9:0] playerHeight2 = 25;



// ____________________________ LEVEL 3


//Rectangle 1
logic [9:0] rect_x13 = 0;
logic [8:0] rect_y13 = 90;
logic [9:0] rect_width13 = 160;
logic [9:0] rect_height13 = 300;

//Rectangle 2
logic [9:0] rect_x23 = 160;
logic [8:0] rect_y23 = 140;
logic [9:0] rect_width23 = 120;
logic [9:0] rect_height23 = 200;

//Rectangle 3
logic [9:0] rect_x33 = 280;
logic [8:0] rect_y33 = 190;
logic [9:0] rect_width33 = 120;
logic [9:0] rect_height33 = 100;

//Rectangle 4
logic [9:0] rect_x43 = 400;
logic [8:0] rect_y43 = 220;
logic [9:0] rect_width43 = 220;
logic [9:0] rect_height43 = 35;

//Rectangle 5(finish)
logic [9:0] rect_x53 = 570;
logic [8:0] rect_y53 = 220;
logic [9:0] rect_width53 = 50;
logic [9:0] rect_height53 = 35;

//Rectangle 6(start)
logic [9:0] rect_x63 = 0;
logic [8:0] rect_y63 = 90;
logic [9:0] rect_width63 = 50;
logic [9:0] rect_height63 = 300;

//Player
logic [9:0] playerX3 = 13;
logic [9:0] playery3 = 230;
logic [9:0] playerWidth3 = 25;
logic [9:0] playerHeight3 = 25;

always_ff @ (posedge clk) begin 
	current_state <= next_state;
	current_gameplay <= next_gameplay;
	level <= next_level;
end 

always_ff
	case (current_state)
		init: begin
					next_level <= level;
					red <= 4'h0;
					green <= 4'h0;
					blue <= 4'h0;
					withinAnyRectangle1 <= 1;
					withinAnyRectangle2 <= 1;
					withinAnyRectangle3 <= 1;
					if (level_select != 2'b00) begin
						next_state <= level_selection;
					end
					else
						next_state <= init;
				next_gameplay <= current_gameplay;
				end
		level_selection: begin
								withinAnyRectangle1 <= 1;
								withinAnyRectangle2 <= 1;
								withinAnyRectangle3 <= 1;
									case (level_select) 
										2'b00: 	begin
													red <= 0;
													blue <= 0;
													green <= 0;
													next_level <= 2'b00;
												end
										2'b01: begin
													if (col >= playerX1 && col < playerX1 + playerWidth1 && row >= playery1 && row < playery1 + playerHeight1)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 0;
														end 


													//start rectangle
													else if (col >= rect_x61 && col < rect_x61 + rect_width11 && row >= rect_y61 && row < rect_y61 + rect_height61)
														begin 
															red <= 0; 
															blue <= 0;
															green <= 4'hF;
														end 
													//draw rectangle1
													else if (col >= rect_x11 && col < rect_x11 + rect_width11 && row >= rect_y11 && row < rect_y11 + rect_height11)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 
													


													//draw rectangle2
												  else if (col >= rect_x21 && col < rect_x21 + rect_width21 && row >= rect_y21 && row < rect_y21 + rect_height21)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 
													



													//draw rectangle3
													else if (col >= rect_x31 && col < rect_x31 + rect_width31 && row >= rect_y31 && row < rect_y31 + rect_height31)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 




													//draw rectangl4
													else if (col >= rect_x41 && col < rect_x41 + rect_width41 && row >= rect_y41 && row < rect_y41 + rect_height41)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 
														// end rectangle
													else if (col >= rect_x71 && col < rect_x71 + rect_width71 && row >= rect_y71 && row < rect_y71 + rect_height71)
														begin 
															red <= 4'hF; 
															blue <= 0;
															green <= 0;
														end 
													



													//draw rectangle5
													else if (col >= rect_x51 && col < rect_x51 + rect_width51 && row >= rect_y51 && row < rect_y51 + rect_height51)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 

													else begin
														red <= 0;
														blue <= 0;
														green <= 0;
													end
													next_level <= 2'b01;
		
												 end
										2'b10: begin
												if (col >= playerX2 && col < playerX2 + playerWidth2 && row >= playery2 && row < playery2 + playerHeight2)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 0;
													end 
												else if (col >= rect_x132 && col < rect_x132 + rect_width132 && row >= rect_y132 && row < rect_y132 + rect_height132)
													begin 
														red <= 0; 
														blue <= 0;
														green <= 4'hF;
													end
												//draw rectangle1
												else if (col >= rect_x12 && col < rect_x12 + rect_width12 && row >= rect_y12 && row < rect_y12 + rect_height12)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												//draw rectangle2
												else if (col >= rect_x22 && col < rect_x22 + rect_width22 && row >= rect_y22 && row < rect_y22 + rect_height22)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle3
												else if (col >= rect_x32 && col < rect_x32 + rect_width32 && row >= rect_y32 && row < rect_y32 + rect_height32)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle4
												else if (col >= rect_x42 && col < rect_x42 + rect_width42 && row >= rect_y42 && row < rect_y42 + rect_height42)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 


												//draw rectangle5
												else if (col >= rect_x52 && col < rect_x52 + rect_width52 && row >= rect_y52 && row < rect_y52 + rect_height52)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												//draw rectangle6
												else if (col >= rect_x62 && col < rect_x62 + rect_width62 && row >= rect_y62 && row < rect_y62 + rect_height62)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle7
												else if (col >= rect_x72 && col < rect_x72 + rect_width72 && row >= rect_y72 && row < rect_y72 + rect_height72)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												//draw rectangle8
												else if (col >= rect_x82 && col < rect_x82 + rect_width82 && row >= rect_y82 && row < rect_y82 + rect_height82)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

													//draw rectangle9
												else if (col >= rect_x92 && col < rect_x92 + rect_width92 && row >= rect_y92 && row < rect_y92 + rect_height92)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

													//draw rectangle10
												else if (col >= rect_x102 && col < rect_x102 + rect_width102 && row >= rect_y102 && row < rect_y102 + rect_height102)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end
													
														//Finish_Rectangle
											  else if (col >= rect_x122 && col < rect_x122 + rect_width122 && row >= rect_y122 && row < rect_y122 + rect_height122)
													begin 
														red <= 4'hF; 
														blue <= 0;
														green <= 0;
													end

													//draw rectangle11
												else if (col >= rect_x112 && col < rect_x112 + rect_width112 && row >= rect_y112 && row < rect_y112 + rect_height112)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end  

												

													
											 
													else begin
														red <= 0; 
														blue <= 0;
														green <= 0;
													end
												next_level <= 2'b10;
												 end
										2'b11: begin 
												if (col >= playerX3 && col < playerX3 + playerWidth3 && row >= playery3 && row < playery3 + playerHeight3)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 0;
													end 
												
												//Start Rectangle
												else if (col >= rect_x63 && col < rect_x63 + rect_width63 && row >= rect_y63 && row < rect_y63 + rect_height63)
													begin 
														red <= 0; 
														blue <= 0;
														green <= 4'hF;
													end 
												//draw rectangle1
												else if (col >= rect_x13 && col < rect_x13 + rect_width13 && row >= rect_y13 && row < rect_y13 + rect_height13)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
													
												//draw rectangle2
											  else if (col >= rect_x23 && col < rect_x23 + rect_width23 && row >= rect_y23 && row < rect_y23 + rect_height23)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle3
												else if (col >= rect_x33 && col < rect_x33 + rect_width33 && row >= rect_y33 && row < rect_y33 + rect_height33)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
													//Finish Rectangle
												else if (col >= rect_x53 && col < rect_x53 + rect_width53 && row >= rect_y53 && row < rect_y53 + rect_height53)
													begin 
														red <= 4'hF; 
														blue <= 0;
														green <= 0;
													end 



												//draw rectangl4
												else if (col >= rect_x43 && col < rect_x43 + rect_width43 && row >= rect_y43 && row < rect_y43 + rect_height43)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												

												else begin
													red <= 0;
													blue <= 0;
													green <= 0;
												end
											next_level <= 2'b11;
												 end 
									endcase
									
										if (!level_lock) begin
											next_state <= level_selection;
										end
										else
											next_state <= gameplay;
									next_gameplay <= current_gameplay;
							  end
		gameplay: begin
					next_level <= level;
		
					case (level) 
										2'b00: 	begin
													red <= 0;
														blue <= 0;
														green <= 0;
												end
										2'b01: begin
													if (col >= playerX1 && col < playerX1 + playerWidth1 && row >= playery1 && row < playery1 + playerHeight1)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 0;
														end 


													//start rectangle
													else if (col >= rect_x61 && col < rect_x61 + rect_width11 && row >= rect_y61 && row < rect_y61 + rect_height61)
														begin 
															red <= 0; 
															blue <= 0;
															green <= 4'hF;
														end 
													//draw rectangle1
													else if (col >= rect_x11 && col < rect_x11 + rect_width11 && row >= rect_y11 && row < rect_y11 + rect_height11)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 
													


													//draw rectangle2
												  else if (col >= rect_x21 && col < rect_x21 + rect_width21 && row >= rect_y21 && row < rect_y21 + rect_height21)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 
													



													//draw rectangle3
													else if (col >= rect_x31 && col < rect_x31 + rect_width31 && row >= rect_y31 && row < rect_y31 + rect_height31)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 




													//draw rectangl4
													else if (col >= rect_x41 && col < rect_x41 + rect_width41 && row >= rect_y41 && row < rect_y41 + rect_height41)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 
														// end rectangle
													else if (col >= rect_x71 && col < rect_x71 + rect_width71 && row >= rect_y71 && row < rect_y71 + rect_height71)
														begin 
															red <= 4'hF; 
															blue <= 0;
															green <= 0;
														end 
													



													//draw rectangle5
													else if (col >= rect_x51 && col < rect_x51 + rect_width51 && row >= rect_y51 && row < rect_y51 + rect_height51)
														begin 
															red <= 4'hF; 
															blue <= 4'hF;
															green <= 4'hF;
														end 

													else begin
														red <= 0;
														blue <= 0;
														green <= 0;
													end
		
												 end
										2'b10: begin
												if (col >= playerX2 && col < playerX2 + playerWidth2 && row >= playery2 && row < playery2 + playerHeight2)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 0;
													end 
												else if (col >= rect_x132 && col < rect_x132 + rect_width132 && row >= rect_y132 && row < rect_y132 + rect_height132)
													begin 
														red <= 0; 
														blue <= 0;
														green <= 4'hF;
													end
												//draw rectangle1
												else if (col >= rect_x12 && col < rect_x12 + rect_width12 && row >= rect_y12 && row < rect_y12 + rect_height12)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												//draw rectangle2
												else if (col >= rect_x22 && col < rect_x22 + rect_width22 && row >= rect_y22 && row < rect_y22 + rect_height22)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle3
												else if (col >= rect_x32 && col < rect_x32 + rect_width32 && row >= rect_y32 && row < rect_y32 + rect_height32)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle4
												else if (col >= rect_x42 && col < rect_x42 + rect_width42 && row >= rect_y42 && row < rect_y42 + rect_height42)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 


												//draw rectangle5
												else if (col >= rect_x52 && col < rect_x52 + rect_width52 && row >= rect_y52 && row < rect_y52 + rect_height52)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												//draw rectangle6
												else if (col >= rect_x62 && col < rect_x62 + rect_width62 && row >= rect_y62 && row < rect_y62 + rect_height62)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle7
												else if (col >= rect_x72 && col < rect_x72 + rect_width72 && row >= rect_y72 && row < rect_y72 + rect_height72)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												//draw rectangle8
												else if (col >= rect_x82 && col < rect_x82 + rect_width82 && row >= rect_y82 && row < rect_y82 + rect_height82)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

													//draw rectangle9
												else if (col >= rect_x92 && col < rect_x92 + rect_width92 && row >= rect_y92 && row < rect_y92 + rect_height92)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

													//draw rectangle10
												else if (col >= rect_x102 && col < rect_x102 + rect_width102 && row >= rect_y102 && row < rect_y102 + rect_height102)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end
													
														//Finish_Rectangle
											  else if (col >= rect_x122 && col < rect_x122 + rect_width122 && row >= rect_y122 && row < rect_y122 + rect_height122)
													begin 
														red <= 4'hF; 
														blue <= 0;
														green <= 0;
													end

													//draw rectangle11
												else if (col >= rect_x112 && col < rect_x112 + rect_width112 && row >= rect_y112 && row < rect_y112 + rect_height112)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end  
											 
													else begin
														red <= 0; 
														blue <= 0;
														green <= 0;
													end
												 end
										2'b11: begin 
												if (col >= playerX3 && col < playerX3 + playerWidth3 && row >= playery3 && row < playery3 + playerHeight3)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 0;
													end 
												
												//Start Rectangle
												else if (col >= rect_x63 && col < rect_x63 + rect_width63 && row >= rect_y63 && row < rect_y63 + rect_height63)
													begin 
														red <= 0; 
														blue <= 0;
														green <= 4'hF;
													end 
												//draw rectangle1
												else if (col >= rect_x13 && col < rect_x13 + rect_width13 && row >= rect_y13 && row < rect_y13 + rect_height13)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
													
												//draw rectangle2
											  else if (col >= rect_x23 && col < rect_x23 + rect_width23 && row >= rect_y23 && row < rect_y23 + rect_height23)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 

												//draw rectangle3
												else if (col >= rect_x33 && col < rect_x33 + rect_width33 && row >= rect_y33 && row < rect_y33 + rect_height33)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
													//Finish Rectangle
												else if (col >= rect_x53 && col < rect_x53 + rect_width53 && row >= rect_y53 && row < rect_y53 + rect_height53)
													begin 
														red <= 4'hF; 
														blue <= 0;
														green <= 0;
													end 



												//draw rectangl4
												else if (col >= rect_x43 && col < rect_x43 + rect_width43 && row >= rect_y43 && row < rect_y43 + rect_height43)
													begin 
														red <= 4'hF; 
														blue <= 4'hF;
														green <= 4'hF;
													end 
												
												

												else begin
													red <= 0;
													blue <= 0;
													green <= 0;
												end
												 end 
									endcase
					
						case (current_gameplay)
						game_init : begin
								withinAnyRectangle1 <= 1;
					withinAnyRectangle2 <= 1;
					withinAnyRectangle3 <= 1;
										
											if (switches != 4'b0000) 
												next_gameplay <= move; 
											else 
												next_gameplay <= game_init;
										end
						move : begin

							if ((playerX1  > rect_x11 && playerX1 + playerWidth1< rect_x11 + rect_width11 && playery1  > rect_y11 && playery1 + playerHeight1 < rect_y11 + rect_height11) ||
							    (playerX1 + playerWidth1 > rect_x21 && playerX1 < rect_x21 + rect_width21 && playery1 > rect_y21 && playery1 + playerHeight1< rect_y21 + rect_height21) ||
							    (playerX1 + playerWidth1 > rect_x31 && playerX1 < rect_x31 + rect_width31 && playery1 + playerHeight1 > rect_y31 && playery1 < rect_y31 + rect_height31) ||
							    (playerX1 + playerWidth1 > rect_x41 && playerX1 < rect_x41 + rect_width41 && playery1 + playerHeight1 > rect_y41 && playery1 < rect_y41 + rect_height41) ||
							    (playerX1 + playerWidth1 > rect_x51 && playerX1 < rect_x51 + rect_width51 && playery1 + playerHeight1 > rect_y51 && playery1 < rect_y51 + rect_height51)) 
						    begin
						        withinAnyRectangle1 <= 1; 
						    end
							 else 
								 withinAnyRectangle1 <= 0;

							if ((playerX2 > rect_x12 && playerX2  + playerWidth2 < rect_x12 + rect_width12 && playery2 > rect_y12 && playery2 + playerHeight2< rect_y12 + rect_height12) ||
							    (playerX2 + playerWidth2 > rect_x22 && playerX2 < rect_x22 + rect_width22 && playery2 + playerHeight2 > rect_y22 && playery2 < rect_y22 + rect_height22) ||
							    (playerX2 + playerWidth2 > rect_x32 && playerX2 < rect_x32 + rect_width32 && playery2 + playerHeight2 > rect_y32 && playery2 < rect_y32 + rect_height32) ||
							    (playerX2 + playerWidth2 > rect_x42 && playerX2 < rect_x42 + rect_width42 && playery2 + playerHeight2 > rect_y42 && playery2 < rect_y42 + rect_height42) ||
							    (playerX2 + playerWidth2 > rect_x52 && playerX2 < rect_x52 + rect_width52 && playery2 + playerHeight2 > rect_y52 && playery2 < rect_y52 + rect_height52) ||
							    (playerX2 + playerWidth2 > rect_x62 && playerX2 < rect_x62 + rect_width62 && playery2 + playerHeight2 > rect_y62 && playery2 < rect_y62 + rect_height62) ||
							    (playerX2 + playerWidth2 > rect_x72 && playerX2 < rect_x72 + rect_width72 && playery2 + playerHeight2 > rect_y72 && playery2 < rect_y72 + rect_height72) ||
							    (playerX2 + playerWidth2 > rect_x82 && playerX2 < rect_x82 + rect_width82 && playery2 + playerHeight2 > rect_y82 && playery2 < rect_y82 + rect_height82) ||
							    (playerX2 + playerWidth2 > rect_x92 && playerX2 < rect_x92 + rect_width92 && playery2 + playerHeight2 > rect_y92 && playery2 < rect_y92 + rect_height92) ||
							    (playerX2 + playerWidth2 > rect_x102 && playerX2 < rect_x102 + rect_width102 && playery2 + playerHeight2 > rect_y102 && playery2 < rect_y102 + rect_height102) ||
							    (playerX2 > rect_x112 && playerX2 + playerWidth2< rect_x112 + rect_width112 && playery2 > rect_y112 && playery2 + playerHeight2< rect_y112 + rect_height112))
							   
							
							    begin
							        withinAnyRectangle2 <= 1; // Player is within at least one rectangle
							    end
								 else withinAnyRectangle2 <= 0;

							if ((playerX3  > rect_x13 && playerX3 + playerWidth3< rect_x13 + rect_width13 && playery3  > rect_y13 && playery3 + playerHeight3 < rect_y13 + rect_height13) ||
							    (playerX3 + playerWidth3 > rect_x23 && playerX3 < rect_x23 + rect_width23 && playery3 > rect_y23 && playery3 + playerHeight3< rect_y23 + rect_height23) ||
							    (playerX3 + playerWidth3 > rect_x33 && playerX3 < rect_x33 + rect_width33 && playery3 > rect_y33 && playery3 + playerHeight3 < rect_y33 + rect_height33) ||
							    (playerX3 + playerWidth3 > rect_x43 && playerX3 < rect_x43 + rect_width43 && playery3 > rect_y43 && playery3 + playerHeight3 < rect_y43 + rect_height43)) 
						    begin
						        withinAnyRectangle3 <= 1; // Player is within at least one rectangle
						    end
							 else withinAnyRectangle3 <= 0;
							 
							
								case (level) 
								2'b01: begin 
										if(!withinAnyRectangle1) 
											next_gameplay <= game_init; 
										else 
											next_gameplay <= move;
								
										end
								2'b10: begin
											if(!withinAnyRectangle2) 
											next_gameplay <= game_init; 
										else 
											next_gameplay <= move;
										end
										
								2'b11: begin
									if(!withinAnyRectangle3) 
											next_gameplay <= game_init; 
										else 
											next_gameplay <= move;
										end
								
								
								endcase
												
								
								 end
								 
						endcase
						
						
					
						
						if (level_lock) 
							next_state <= gameplay; 
						else
							next_state <= level_selection;
					 end
	endcase
	
	always @ (posedge clk) begin
		if (current_state == gameplay && current_gameplay == move) begin
				case(level) 

							2'b01: begin

								 if(!withinAnyRectangle1 || ~KEY0)begin
									playerX1 <= 113;
									playery1 <= 443;
									end
							
									  
								  //move left
								  if (switches[3] == 1 && withinAnyRectangle1) begin
										playerX1 <= playerX1 - 5;
								  end
								  //move up
								  else if (switches[2] == 1 && withinAnyRectangle1 ) begin
										playery1 <= playery1 - 5;
								  end
								  //move down
								  else if (switches[1] == 1 && withinAnyRectangle1 ) begin
										playery1 <= playery1 + 5;
								  end
								  //move right
								  else if (switches[0] == 1 && withinAnyRectangle1) begin
										playerX1 <= playerX1 + 5;
								  end
							end

								2'b10: begin
									 if(!withinAnyRectangle2 || ~KEY0)begin
										playerX2 <= 33;
										playery2 <= 443;
										end
								
										  
									  //move left
									  if (switches[3] == 1 && withinAnyRectangle2) begin
											playerX2 <= playerX2 - 5;
									  end
									  //move up
									  else if (switches[2] == 1 && withinAnyRectangle2 ) begin
											playery2 <= playery2 - 5;
									  end
									  //move down
									  else if (switches[1] == 1 && withinAnyRectangle2 ) begin
											playery2 <= playery2 + 5;
									  end
									  //move right
									  else if (switches[0] == 1 && withinAnyRectangle2) begin
											playerX2 <= playerX2 + 5;
									  end
								end

								2'b11: begin 
									 if(!withinAnyRectangle3 || ~KEY0)begin
										playerX3 <= 13;
										playery3 <= 230;
										end
								 
									  //move left
									  if (switches[3] == 1 && withinAnyRectangle3) begin
											playerX3 <= playerX3 - 5;
									  end
									  //move up
									  else if (switches[2] == 1 && withinAnyRectangle3 ) begin
											playery3 <= playery3 - 5;
									  end
									  //move down
									  else if (switches[1] == 1 && withinAnyRectangle3 ) begin
											playery3 <= playery3 + 5;
									  end
									  //move right
									  else if (switches[0] == 1 && withinAnyRectangle3) begin
											playerX3 <= playerX3 + 5;
									  end
								end
							endcase 
						end
					else begin 
					
					end
	end

endmodule 
