//Copyright (C)2014-2019 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.3Beta
//Part Number: GW1N-LV1QN48C6/I5
//Created Time: Wed Dec 25 13:30:22 2019

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_User_Flash your_instance_name(
        .dout(dout_o), //output [31:0] dout
        .ra(ra_i), //input [5:0] ra
        .ca(ca_i), //input [5:0] ca
        .pa(pa_i), //input [5:0] pa
        .mode(mode_i), //input [3:0] mode
        .seq(seq_i), //input [1:0] seq
        .aclk(aclk_i), //input aclk
        .rmode(rmode_i), //input [1:0] rmode
        .wmode(wmode_i), //input [1:0] wmode
        .rbytesel(rbytesel_i), //input [1:0] rbytesel
        .wbytesel(wbytesel_i), //input [1:0] wbytesel
        .pw(pw_i), //input pw
        .reset(reset_i), //input reset
        .pe(pe_i), //input pe
        .oe(oe_i), //input oe
        .din(din_i) //input [31:0] din
    );

//--------Copy end-------------------
