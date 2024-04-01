module Level3 (
   // VGA-related signals
pixel_clk,
   col,
   row,
   red,
   green,
   blue,
   // input push buttons and switches
   resetSwitch,
   switches
   );

input [9:0]  col;
input [8:0]  row;

input  resetSwitch,pixel_clk ;
input [3:0] switches;

output logic [3:0]  red;    // 4-bit color output
output logic [3:0]  green;  // 4-bit color output
output logic [3:0]  blue;   // 4-bit color output
logic clk;

FastClock(pixel_clk,clk);
logic withinAnyRectangle;


//Rectangle 1
logic [9:0] rect_x1 = 0;
logic [8:0] rect_y1 = 90;
logic [9:0] rect_width1 = 160;
logic [9:0] rect_height1 = 300;

//Rectangle 2
logic [9:0] rect_x2 = 160;
logic [8:0] rect_y2 = 140;
logic [9:0] rect_width2 = 120;
logic [9:0] rect_height2 = 200;

//Rectangle 3
logic [9:0] rect_x3 = 280;
logic [8:0] rect_y3 = 190;
logic [9:0] rect_width3 = 120;
logic [9:0] rect_height3 = 100;

//Rectangle 4
logic [9:0] rect_x4 = 400;
logic [8:0] rect_y4 = 220;
logic [9:0] rect_width4 = 220;
logic [9:0] rect_height4 = 35;

//Rectangle 5(finish)
logic [9:0] rect_x5 = 570;
logic [8:0] rect_y5 = 220;
logic [9:0] rect_width5 = 50;
logic [9:0] rect_height5 = 35;

//Rectangle 6(start)
logic [9:0] rect_x6 = 0;
logic [8:0] rect_y6 = 90;
logic [9:0] rect_width6 = 50;
logic [9:0] rect_height6 = 300;

//Player
logic [9:0] playerX = 13;
logic [9:0] playery = 230;
logic [9:0] playerWidth = 25;
logic [9:0] playerHeight = 25;




	
always_ff begin
		if (col >= playerX && col < playerX + playerWidth && row >= playery && row < playery + playerHeight)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 0;
			end 
		
		//Start Rectangle
		else if (col >= rect_x6 && col < rect_x6 + rect_width6 && row >= rect_y6 && row < rect_y6 + rect_height6)
			begin 
				red <= 0; 
				blue <= 0;
				green <= 4'hF;
			end 
      //draw rectangle1
      else if (col >= rect_x1 && col < rect_x1 + rect_width1 && row >= rect_y1 && row < rect_y1 + rect_height1)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 
			
      //draw rectangle2
     else if (col >= rect_x2 && col < rect_x2 + rect_width2 && row >= rect_y2 && row < rect_y2 + rect_height2)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 

      //draw rectangle3
      else if (col >= rect_x3 && col < rect_x3 + rect_width3 && row >= rect_y3 && row < rect_y3 + rect_height3)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 
			//Finish Rectangle
		else if (col >= rect_x5 && col < rect_x5 + rect_width5 && row >= rect_y5 && row < rect_y5 + rect_height5)
			begin 
				red <= 4'hF; 
				blue <= 0;
				green <= 0;
			end 



      //draw rectangl4
      else if (col >= rect_x4 && col < rect_x4 + rect_width4 && row >= rect_y4 && row < rect_y4 + rect_height4)
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
always_ff begin
if ((playerX  > rect_x1 && playerX + playerWidth< rect_x1 + rect_width1 && playery  > rect_y1 && playery + playerHeight < rect_y1 + rect_height1) ||
        (playerX + playerWidth > rect_x2 && playerX < rect_x2 + rect_width2 && playery > rect_y2 && playery + playerHeight< rect_y2 + rect_height2) ||
        (playerX + playerWidth > rect_x3 && playerX < rect_x3 + rect_width3 && playery > rect_y3 && playery + playerHeight < rect_y3 + rect_height3) ||
        (playerX + playerWidth > rect_x4 && playerX < rect_x4 + rect_width4 && playery > rect_y4 && playery + playerHeight < rect_y4 + rect_height4)) 
    begin
        withinAnyRectangle = 1; // Player is within at least one rectangle
    end
	 else withinAnyRectangle = 0;
	 
	 
end
always @(posedge clk) begin

	 
	 if(!withinAnyRectangle)begin
		playerX <= 13;
		playery <= 230;
		end

	  //move left
	  if (switches[3] == 1 && withinAnyRectangle) begin
			playerX <= playerX - 5;
	  end
	  //move up
	  else if (switches[2] == 1 && withinAnyRectangle ) begin
			playery <= playery - 5;
	  end
	  //move down
	  else if (switches[1] == 1 && withinAnyRectangle ) begin
			playery <= playery + 5;
	  end
	  //move right
	  else if (switches[0] == 1 && withinAnyRectangle) begin
			playerX <= playerX + 5;
	  end
end

          


endmodule
