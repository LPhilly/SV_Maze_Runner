module FinalLevel1SV (
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

input [3:0] switches;

input  resetSwitch,pixel_clk ;
    


output logic [3:0]  red;    // 4-bit color output
output logic [3:0]  green;  // 4-bit color output
output logic [3:0]  blue;   // 4-bit color output
logic clk;

FastClock(pixel_clk,clk);
// Internal signals for rectangle properties

//Rectangle 1
logic [9:0] rect_x1 = 100;
logic [8:0] rect_y1 = 100;
logic [9:0] rect_width1 = 50;
logic [9:0] rect_height1 = 380;

//Rectangle 2
logic [9:0] rect_x2 = 150;
logic [8:0] rect_y2 = 100;
logic [9:0] rect_width2 = 150;
logic [9:0] rect_height2 = 50;

//Rectangle 3
logic [9:0] rect_x3 = 300;
logic [8:0] rect_y3 = 100;
logic [9:0] rect_width3 = 50;
logic [9:0] rect_height3 = 380;

//Rectangle 4
logic [9:0] rect_x4 = 350;
logic [8:0] rect_y4 = 350;
logic [9:0] rect_width4 = 150;
logic [9:0] rect_height4 = 130;

//Rectangle 5
logic [9:0] rect_x5 = 500;
logic [8:0] rect_y5 = 0;
logic [9:0] rect_width5 = 140;
logic [9:0] rect_height5 = 480;

//Start Rectangle
logic [9:0] rect_x6 = 100;
logic [8:0] rect_y6 = 430;
logic [9:0] rect_width6 = 50;
logic [9:0] rect_height6 = 50;

//Finish Rectangle
logic [9:0] rect_x7 = 500;
logic [8:0] rect_y7 = 0;
logic [9:0] rect_width7 = 140;
logic [9:0] rect_height7 = 50;

//Player
logic [9:0] playerX = 113;
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


		//start rectangle
		else if (col >= rect_x6 && col < rect_x6 + rect_width1 && row >= rect_y6 && row < rect_y6 + rect_height6)
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




      //draw rectangl4
      else if (col >= rect_x4 && col < rect_x4 + rect_width4 && row >= rect_y4 && row < rect_y4 + rect_height4)
			begin 
				red <= 4'hF; 
				blue <= 4'hF;
				green <= 4'hF;
			end 
			// end rectangle
      else if (col >= rect_x7 && col < rect_x7 + rect_width7 && row >= rect_y7 && row < rect_y7 + rect_height7)
			begin 
				red <= 4'hF; 
				blue <= 0;
				green <= 0;
			end 
		



      //draw rectangle5
      else if (col >= rect_x5 && col < rect_x5 + rect_width5 && row >= rect_y5 && row < rect_y5 + rect_height5)
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
//logic [9:0] rect_x1 = 100;
//logic [8:0] rect_y1 = 100;
//logic [9:0] rect_width1 = 50;
//logic [9:0] rect_height1 = 380;
always @(posedge clk) begin
	if(playerX < 100 || playerX + playerWidth > 150)begin
		playerX <= 113;
		playery <= 443;
	end
	
		  
	  //move left
	  if (switches[3] == 1) begin
			playerX <= playerX - 5;
	  end
	  //move up
	  else if (switches[2] == 1  ) begin
			playery <= playery - 5;
	  end
	  //move down
	  else if (switches[1] == 1  ) begin
			playery <= playery + 5;
	  end
	  //move right
	  else if (switches[0] == 1 ) begin
			playerX <= playerX + 5;
	  end
	  
	  

end

          


endmodule
