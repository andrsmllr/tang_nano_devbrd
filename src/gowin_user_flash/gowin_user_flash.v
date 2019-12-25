//Copyright (C)2014-2019 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.3Beta
//Part Number: GW1N-LV1QN48C6/I5
//Created Time: Wed Dec 25 13:30:21 2019

module Gowin_User_Flash (dout, ra, ca, pa, mode, seq, aclk, rmode, wmode, rbytesel, wbytesel, pw, reset, pe, oe, din);

output [31:0] dout;
input [5:0] ra;
input [5:0] ca;
input [5:0] pa;
input [3:0] mode;
input [1:0] seq;
input aclk;
input [1:0] rmode;
input [1:0] wmode;
input [1:0] rbytesel;
input [1:0] wbytesel;
input pw;
input reset;
input pe;
input oe;
input [31:0] din;

FLASH96K flash_inst (
    .DOUT(dout),
    .RA(ra),
    .CA(ca),
    .PA(pa),
    .MODE(mode),
    .SEQ(seq),
    .ACLK(aclk),
    .RMODE(rmode),
    .WMODE(wmode),
    .RBYTESEL(rbytesel),
    .WBYTESEL(wbytesel),
    .PW(pw),
    .RESET(reset),
    .PE(pe),
    .OE(oe),
    .DIN(din)
);

endmodule //Gowin_User_Flash
