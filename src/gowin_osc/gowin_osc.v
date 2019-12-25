//Copyright (C)2014-2019 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.3Beta
//Part Number: GW1N-LV1QN48C6/I5
//Created Time: Wed Dec 25 13:58:48 2019

module Gowin_OSC_div96 (oscout);

output oscout;

OSCH osc_inst (
    .OSCOUT(oscout)
);

defparam osc_inst.FREQ_DIV = 96;

endmodule //Gowin_OSC_div96
