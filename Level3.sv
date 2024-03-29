module FinalLevel3 (
   // VGA-related signals
pixel_clk,
   col,
   row,
   red,
   green,
   blue,
   // input push buttons and switches
   resetSwitch,
   //add more inputs based on FSM
   );

input [9:0]  col;
input [8:0]  row;

input  resetSwitch,pixel_clk ;
    

output logic [3:0]  red;    // 4-bit color output
output logic [3:0]  green;  // 4-bit color output
output logic [3:0]  blue;   // 4-bit color output
logic clk;

FastClock(pixel_clk,clk);
// Internal signals for rectangle properties

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
logic [9:0] rect_x5 = 600;
logic [8:0] rect_y5 = 220;
logic [9:0] rect_width5 = 50;
logic [9:0] rect_height5 = 35;

//Rectangle 6(start)
logic [9:0] rect_x6 = 0;
logic [8:0] rect_y6 = 90;
logic [9:0] rect_width6 = 50;
logic [9:0] rect_height6 = 300;





	
always_ff begin
		//Start Rectangle
		if (col >= rect_x6 && col < rect_x6 + rect_width6 && row >= rect_y6 && row < rect_y6 + rect_height6)
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
			
			//Start Rectangle
		
		


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
		
		//Finish Rectangle
		else if (col >= rect_x5 && col < rect_x5 + rect_width5 && row >= rect_y5 && row < rect_y5 + rect_height5)
			begin 
				red <= 4'hF; 
				blue <= 0;
				green <= 0;
			end 
		

		else begin
			red <= 0;
			blue <= 0;
			green <= 0;
		end
end

          


endmodule