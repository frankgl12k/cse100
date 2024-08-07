`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 4/11/2020 05:26:52 PM
// Design Name: 
// Module Name: show_7segDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//wire [7:0] D7Seg3,D7Seg2,D7Seg1,D7Seg0;  
//show_7segDisplay  showit (.seg(seg),.dp(dp),.an(an),
//  .D7Seg0(D7Seg0),.D7Seg1(D7Seg1),.D7Seg2(D7Seg2),.D7Seg3(D7Seg3));
 
  
module show_7segDisplay (
 input [6:0] seg,
 input dp,
 input [3:0] an,
 output reg [7:0] D7Seg0, D7Seg1, D7Seg2,D7Seg3);

 reg [7:0] val;
 
 wire AN0, AN1, AN2, AN3;
 assign AN0=an[0];
 assign AN1=an[1];
 assign AN2=an[2];
 assign AN3=an[3];

  always @(AN0 or val)
   begin
            if (AN0 == 0) D7Seg0 <= val;
            else if (AN0 == 1) D7Seg0 <= " ";
            else D7Seg0 <= 8'bX;   //  non-blocking assignment
   end

  always @(AN1 or val)
   begin
            if (AN1 == 0) D7Seg1 <= val;
            else if (AN1 == 1) D7Seg1 <= " ";
            else D7Seg1 <= 8'bX;   //  non-blocking assignment
   end

  always @(AN2 or val)
   begin
            if (AN2 == 0) D7Seg2 <= val;
            else if (AN2 == 1) D7Seg2 <= " ";
            else D7Seg2 <= 8'bX;   //  non-blocking assignment
   end

  always @(AN3 or val)
   begin
            if (AN3 == 0) D7Seg3 <= val;
            else if (AN3 == 1) D7Seg3 <= " ";
            else D7Seg3 <= 8'bX;   //  non-blocking assignment
   end

    always @(seg)
    case (seg)
    7'b0111111:
         val = "-";
    7'b1111111:
         val = " ";
    7'b1000000:
         val = "0";
    7'b1111001:
         val = "1";
    7'b0100100:
         val = "2";
    7'b0110000:
         val = "3";
    7'b0011001:
         val = "4";
    7'b0010010:
         val = "5";
    7'b0000010:
         val = "6";
    7'b1111000:
         val = "7";
    7'b0000000:
         val = "8";
    7'b0011000:
         val = "9";
    7'b0001000:
         val = "A";
    7'b0000011:
         val = "B";
    7'b1000110:
         val = "C";
    7'b0100001:
         val = "D";
    7'b0000110:
         val = "E";
    7'b0001110:
         val = "F";
    default:
         val = 8'bX;
    endcase
endmodule

