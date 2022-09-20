// 16-bit adder testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021

// #1 = 1ns
`timescale 1ns/100ps 

module adder_16bit_tb();

// Internal connections
reg [15:0]  a;
reg [15:0]  b;
reg         cin;
wire [15:0] s;
wire        cout;

// Instantiate adder_16bit as dut (device under test)

adder_16bit dut(a, b, cin, s, cout);

// Test vectors
initial
begin
// Enter you stimulus below this line
// 38 test vectors required for connectivity tests
// Check all adders are connected to something, S=0 cout=0 not Xs
#100 a=16'h0000; b=16'h0000; cin=0;
//Check connections for A[0], B[0], Cin, S[0], S=0001 cout=0
#100 a=16'h0001;
#100 a=16'h0000; b=16'h0001;
#100 a=16'h0000; b=16'h0000; cin=1;
//Check connections for  A[1], B[1], S[1]
#100 a=16'h0002; b=16'h0000; cin=0;
#100 a=16'h0000; b=16'h0002;
//Check connections for  A[2], B[2], S[2]
#100 a=16'h0004; b=16'h0000;
#100 a=16'h0000; b=16'h0004;
//Check connections for  A[3], B[3], S[3]
#100 a=16'h0008; b=16'h0000;
#100 a=16'h0000; b=16'h0008;
//Check connection of carry out of the first 4bit adder in to 2nd 4-bit adder
#100 a=16'h0008; b=16'h0008;
// ADD YOUR TEST VECTORS after this line
// Continue with the same pattern shown above
// 27 test vectors including the carry out
// -------------------------------------------------
//Checking connections for A[4], B[4], S[4]
#100 a=16'h0010; b=16'h0000;
#100 a=16'h0000; b=16'h0010;
//Checking connection for A[5], B[5], S[5]
#100 a=16'h0020; b=16'h0000;
#100 a=16'h0000; b=16'h0020;
//Checking connections for A[6], B[6], S[6]
#100 a=16'h0040; b=16'h0000;
#100 a=16'h0000; b=16'h0040;
//Checking connections for A[7], B[7], S[7]
#100 a=16'h0080; b=16'h0000;
#100 a=16'h0000; b=16'h0080;
//Checking the carry out of the 2nd 4bit adder in to 3rd 4bit adder
#100 a=16'h0080; b=16'h0080;

//Checking connections for A[8], B[8], S[8]
#100 a=16'h0100; b=16'h0000;
#100 a=16'h0000; b=16'h0100;
//Checking connections for A[9], B[9], S[9]
#100 a=16'h0200; b=16'h0000;
#100 a=16'h0000; b=16'h0200;
//Checking connections for A[10], B[10], S[10]
#100 a=16'h0400; b=16'h0000;
#100 a=16'h0000; b=16'h0400;
//Checking connectioons for A[11], B[11], S[11]
#100 a=16'h0800; b=16'h0000;
#100 a=16'h0000; b=16'h0800;
//Checking the carry out of the 3rd 4bit adder in to 4th 4 bit adder
#100 a=16'h0800; b=16'h0800;

//Checking connections A[12], B[12], S[12]
#100 a=16'h1000; b=16'h0000;
#100 a=16'h0000; b=17'h1000;
//Checking connections A[13], B[13], S[13]
#100 a=16'h2000; b=16'h0000;
#100 a=16'h0000; b=16'h2000;
//Checking connections A[14], B[14], S[14]
#100 a=16'h4000; b=16'h0000;
#100 a=16'h0000; b=16'h4000;
//Checking connections A[15], B[15], S[15]
#100 a=16'h8000; b=16'h0000;
#100 a=16'h0000; b=16'h8000;

//Checking cout is working
#100 a=16'h8000; b=16'h8000;
// Connectivity tests completed.

// ADD TESTS FOR FINDING MAXIMUM CARRY DELAY HERE
// 2 test vectors required - one to initialise followed by the 2nd to exercise
// the critical path
#100 a=16'h0000; b=16'h0000; cin=0;
#100 a=16'hFFFF; b=16'h0000; cin=1;



// -------------------------------------------------
// Please make sure your stimulus is above this line
// delay for end of wave traces to be visible
#100 $finish;
end
 
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("adder_16bit_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
