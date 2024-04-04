module ADXL345_SPI_Interface (
    input wire clk,
    input wire miso, // Master In Slave Out - ADXL345's Data Out
    output wire mosi, // Master Out Slave In - ADXL345's Data In
    output wire sclk, // SPI Clock
    output wire cs, // Chip Select
    output reg [1:0] tilt_direction // 00: no tilt, 01: tilt left/right, 10: tilt up/down
);

// SPI operation parameters
parameter CLK_DIV = 16; // SPI clock divider
parameter INIT = 0, READ_X = 1, READ_Y = 2, PROCESS_DATA = 3; // States
reg [7:0] state = INIT;
reg [7:0] clk_counter = 0;
reg spi_clk = 0;
reg [7:0] data_buffer = 0; // Buffer to store read data
reg [15:0] x_data = 0, y_data = 0; // Acceleration data buffers

// Generate SPI clock
always @(posedge clk) begin
    if (clk_counter < CLK_DIV/2) begin
        clk_counter <= clk_counter + 1;
    end else begin
        clk_counter <= 0;
        spi_clk <= ~spi_clk;
    end
end

// SPI communication logic
always @(posedge spi_clk) begin
    case (state)
        INIT: begin
            // Initialize ADXL345 (write to POWER_CTL register to start measurement)
            // Transition to READ_X after initialization
            state <= READ_X;
        end
        READ_X: begin
            // Read X-axis data
            // Transition to READ_Y after reading X
            state <= READ_Y;
        end
        READ_Y: begin
            // Read Y-axis data
            // Transition to PROCESS_DATA after reading Y
            state <= PROCESS_DATA;
        end
        PROCESS_DATA: begin
            // Process the acceleration data to determine tilt direction
            // Example condition, adjust based on your requirements
            if (x_data > 51) tilt_direction <= 01; // Tilt left/right
            else if (y_data > 51) tilt_direction <= 10; // Tilt up/down
            else tilt_direction <= 00; // No significant tilt
            state <= READ_X; // Loop back to read again
        end
    endcase
end

// Assign outputs to SPI signals
assign mosi = (state == INIT || state == READ_X || state == READ_Y) ? data_buffer[7] : 1'b0;
assign cs = (state == INIT); // Chip select active in INIT state
assign sclk = spi_clk;

endmodule
