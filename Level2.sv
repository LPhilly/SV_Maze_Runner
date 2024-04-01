module Level2 (
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
logic withinAnyRectangle;

FastClock(pixel_clk,clk);
// Internal signals for rectangle properties

//Rectangle 1
logic [9:0] rect_x1 = 20;
logic [8:0] rect_y1 = 100;
logic [9:0] rect_width1 = 50;
logic [9:0] rect_height1 = 380;

//Rectangle 2
logic [9:0] rect_x2 = 20;
logic [8:0] rect_y2 = 50;
logic [9:0] rect_width2 = 130;
logic [9:0] rect_height2 = 50;

//Rectangle 3
logic [9:0] rect_x3 = 100;
logic [8:0] rect_y3 = 100;
logic [9:0] rect_width3 = 50;
logic [9:0] rect_height3 = 350;

//Rectangle 4
logic [9:0] rect_x4 = 120;
logic [8:0] rect_y4 = 400;
logic [9:0] rect_width4 = 430;
logic [9:0] rect_height4 = 50;

//Rectangle 5
logic [9:0] rect_x5 = 500;
logic [8:0] rect_y5 = 100;
logic [9:0] rect_width5 = 50;
logic [9:0] rect_height5 = 300;

//Rectangle 6
logic [9:0] rect_x6 = 370;
logic [8:0] rect_y6 = 100;
logic [9:0] rect_width6 = 130;
logic [9:0] rect_height6 = 50;

//Rectangle 7
logic [9:0] rect_x7 = 320;
logic [8:0] rect_y7 = 100;
logic [9:0] rect_width7 = 50;
logic [9:0] rect_height7 = 170;

//Rectangle 8
logic [9:0] rect_x8 = 190;
logic [8:0] rect_y8 = 220;
logic [9:0] rect_width8 = 130;
logic [9:0] rect_height8 = 50;

//Rectangle 9
logic [9:0] rect_x9 = 190;
logic [8:0] rect_y9 = 30;
logic [9:0] rect_width9 = 50;
logic [9:0] rect_height9 = 190;

//Rectangle 10
logic [9:0] rect_x10 = 190;
logic [8:0] rect_y10 = 30;
logic [9:0] rect_width10 = 450;
logic [9:0] rect_height10 = 50;

//Rectangle 11
logic [9:0] rect_x11 = 590;
logic [8:0] rect_y11 = 55;
logic [9:0] rect_width11 = 50;
logic [9:0] rect_height11 = 425;

//Finish_Rectangle
logic [9:0] rect_x12 = 590;
logic [8:0] rect_y12 = 430;
logic [9:0] rect_width12 = 50;
logic [9:0] rect_height12 = 50;

//Start_Rectangle
logic [9:0] rect_x13 = 20;
logic [8:0] rect_y13 = 430;
logic [9:0] rect_width13 = 50;
logic [9:0] rect_height13 = 50;

//Player
logic [9:0] playerX = 33;
logic [9:0] playery = 443;
logic [9:0] playerWidth = 25;
logic [9:0] playerHeight = 25;


always_ff begin
		if (col >= playerX && col < playerX + playerWidth && row >= playery && row < playery + playerHeight)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 0;
			end 
		else if (col >= rect_x13 && col < rect_x13 + rect_width13 && row >= rect_y13 && row < rect_y13 + rect_height13)
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

      //draw rectangle4
      else if (col >= rect_x4 && col < rect_x4 + rect_width4 && row >= rect_y4 && row < rect_y4 + rect_height4)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 


      //draw rectangle5
      else if (col >= rect_x5 && col < rect_x5 + rect_width5 && row >= rect_y5 && row < rect_y5 + rect_height5)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 
		
		//draw rectangle6
      else if (col >= rect_x6 && col < rect_x6 + rect_width6 && row >= rect_y6 && row < rect_y6 + rect_height6)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 

		//draw rectangle7
      else if (col >= rect_x7 && col < rect_x7 + rect_width7 && row >= rect_y7 && row < rect_y7 + rect_height7)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 
		
		//draw rectangle8
      else if (col >= rect_x8 && col < rect_x8 + rect_width8 && row >= rect_y8 && row < rect_y8 + rect_height8)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 

			//draw rectangle9
      else if (col >= rect_x9 && col < rect_x9 + rect_width9 && row >= rect_y9 && row < rect_y9 + rect_height9)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 

			//draw rectangle10
      else if (col >= rect_x10 && col < rect_x10 + rect_width10 && row >= rect_y10 && row < rect_y10 + rect_height10)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end
			
				//Finish_Rectangle
	  else if (col >= rect_x12 && col < rect_x12 + rect_width12 && row >= rect_y12 && row < rect_y12 + rect_height12)
			begin 
				red <= 4'hF; 
				blue <= 0;
				green <= 0;
			end

			//draw rectangle11
      else if (col >= rect_x11 && col < rect_x11 + rect_width11 && row >= rect_y11 && row < rect_y11 + rect_height11)
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
    if ((playerX > rect_x1 && playerX  + playerWidth < rect_x1 + rect_width1 && playery > rect_y1 && playery + playerHeight< rect_y1 + rect_height1) ||
        (playerX + playerWidth > rect_x2 && playerX < rect_x2 + rect_width2 && playery + playerHeight > rect_y2 && playery < rect_y2 + rect_height2) ||
        (playerX + playerWidth > rect_x3 && playerX < rect_x3 + rect_width3 && playery + playerHeight > rect_y3 && playery < rect_y3 + rect_height3) ||
        (playerX + playerWidth > rect_x4 && playerX < rect_x4 + rect_width4 && playery + playerHeight > rect_y4 && playery < rect_y4 + rect_height4) ||
        (playerX + playerWidth > rect_x5 && playerX < rect_x5 + rect_width5 && playery + playerHeight > rect_y5 && playery < rect_y5 + rect_height5) ||
        (playerX + playerWidth > rect_x6 && playerX < rect_x6 + rect_width6 && playery + playerHeight > rect_y6 && playery < rect_y6 + rect_height6) ||
        (playerX + playerWidth > rect_x7 && playerX < rect_x7 + rect_width7 && playery + playerHeight > rect_y7 && playery < rect_y7 + rect_height7) ||
        (playerX + playerWidth > rect_x8 && playerX < rect_x8 + rect_width8 && playery + playerHeight > rect_y8 && playery < rect_y8 + rect_height8) ||
        (playerX + playerWidth > rect_x9 && playerX < rect_x9 + rect_width9 && playery + playerHeight > rect_y9 && playery < rect_y9 + rect_height9) ||
        (playerX + playerWidth > rect_x10 && playerX < rect_x10 + rect_width10 && playery + playerHeight > rect_y10 && playery < rect_y10 + rect_height10) ||
        (playerX > rect_x11 && playerX + playerWidth< rect_x11 + rect_width11 && playery > rect_y11 && playery + playerHeight< rect_y11 + rect_height11))
   

    begin
        withinAnyRectangle = 1; // Player is within at least one rectangle
    end
	 else withinAnyRectangle = 0;
	 
	 
end
always @(posedge clk) begin

	 
	 if(!withinAnyRectangle)begin
		playerX <= 33;
		playery <= 443;
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
