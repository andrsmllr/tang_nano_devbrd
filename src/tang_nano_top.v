`timescale 1 ns / 1 ps

module tang_nano_top
(
    input  wire       XTAL_IN,
    input  wire       USER_BTN_A,
    input  wire       USER_BTN_B,
    //output reg        LCD_BL,
    output reg        LCD_CLK,
    output reg        LCD_DE,
    output reg        LCD_HSYNC,
    output reg        LCD_VSYNC,
    output reg  [4:0] LCD_R,
    output reg  [5:0] LCD_G,
    output reg  [4:0] LCD_B,
    //output reg        FPGA_TX,
    //input  wire       FPGA_RX,
    //output reg        PSRAM_SCLK,
    //output reg        PSRAM_CE,
    //inout             PSRAM_SIO0,
    //inout             PSRAM_SIO1,
    //inout             PSRAM_SIO2,
    //inout             PSRAM_SIO3,
    output reg        LED_R,
    output reg        LED_G,
    output reg        LED_B
);

initial begin
    LCD_CLK    <= 1'b0;
    LCD_DE     <= 1'b0;
    LCD_HSYNC  <= 1'b0;
    LCD_VSYNC  <= 1'b0;
    LCD_R      <= 5'b00000;
    LCD_G      <= 6'b000000;
    LCD_B      <= 5'b00000;
    LED_R      <= 1'b0;
    LED_G      <= 1'b0;
    LED_B      <= 1'b0;
end

assign clk_24M = XTAL_IN;
assign rstn = USER_BTN_B;

/* On-Chip Oscillator 2.5 MHz (240 MHz / 96). ********************************/
wire clk_2M5;
Gowin_OSC_div96 Gowin_OSC_div96_inst (.oscout(clk_2M5));

/* On-Chip PLL 108 MHz. *****************************************************/
wire clk_108M;
wire pll_lock;
wire pll_reset = 1'b0;

Gowin_rPLL Gowin_rPLL_inst(
    .clkout(clk_108M),
    .lock(pll_lock),
    .reset(pll_reset),
    .clkin(clk_24M));

reg [1:0] cnt_clkdiv = 'd0;
always @ (posedge clk_108M)
begin
    cnt_clkdiv <= cnt_clkdiv + 1;
    if (cnt_clkdiv == 'd1) begin
        LCD_CLK <= ~LCD_CLK;
        cnt_clkdiv <= 0;
    end
end

/* Counter for LED blinking. ************************************************/
parameter CNT_LEN = 26;
reg [CNT_LEN-1:0] cnt = 0;

always @ (posedge clk_2M5, negedge rstn)
begin
    if (rstn == 1'b0) begin
        cnt <= 'd0;
    end else begin
        cnt <= cnt + 1;
    end
end

always @ (*)
begin
    LED_R <= ~cnt[CNT_LEN-1];
    LED_G <= ~cnt[CNT_LEN-2];
    LED_B <= ~cnt[CNT_LEN-3];
end

endmodule
