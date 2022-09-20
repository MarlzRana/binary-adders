// 4-bit adder testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021

// #1 = 1ns
`timescale 1ns/100ps 

module adder_4bit_tb();

// Internal connections
reg [3:0] a;
reg [3:0] b;
reg       cin;
wire [3:0] s;
wire cout;

// Instantiate adder_4bit as dut (device under test)

adder_4bit dut(a, b, cin, s, cout);

// Test vectors
initial
begin
// Enter you stimulus below this line
// Using 14 test vectors the interconnect of the 4bit added can be verified

// Check all fulladders are connected to something, s=0 cout=0 not Xs
//If a tristate (Z) or unknown state (X) we know we have some sort of physical connection issue intially and not a logical connection issue yet/not at all
#100 a='b0000; b='b0000; cin=0;
// Check connections for a[0], b[0], cin, S[0], S=0001 cout=0
#100 a='b0001; b='b0000; cin=0;
#100 a='b0000; b='b0001; cin=0;
#100 a='b0000; b='b0000; cin=1;
// Check connection of carry out of the first adder
#100 a='b0001; b='b0001; cin=0;
// Check connections for a[1], b[1], c[1]
#100 a='b0010; b='b0000; cin=0;
#100 a='b0000; b='b0010; cin=0;
// ADD 7 MORE TESTS TO COMPLETE CONNECTIVITY TESTS
// for each add your test vectors before the semicolon after the delay
#100 a='b0010; b='b0010; cin=0; //I am testing if the carry bit of the second full adder is connected to the third full adder correctly a postive result would indicate the s2 would be 1
//Checking the connections for what a[2], b[2], c[2] and they should if connected correctly produce s2 = 1
#100 a='b0100; b='b0000; cin = 0;
#100 a='b0000; b='b0100; cin = 0;
//We are checking the carry wire coming out of full bit adder 3 is connected to full bit adder 4 correctly as full bit adder 3 would produce a cout/ c[2] of 1 and it would be fed to full adder 4 as cin input and a=0 and b=0 so it should produce a s[3] of 1 if the wire inbetween them are connected correctly
#100 a='b0100; b='b0100; cin = 0;
//Checking the connections for what a[3], b[3], c[3] and they should if connected correctly produce s3 = 1
#100 a='b1000; b='b0000; cin = 0;
#100 a='b0000; b='b1000; cin = 0;

#100 a='b1000; b='b1000; cin=0;

// Connectivity tests completed.

// ADD TESTS FOR FINDING MAXIMUM CARRY DELAY HERE
// 2 test vectors required - one to initialise followed by the 2nd to exercise
// the critical path
#100 a='b0000; b='b0000; cin=0;
#100 a='b1111; b='b0000; cin=1;

// Please make sure your stimulus is above this line
// delay for end of wave traces to be visible
#100 $finish; // exit the simulation
end
 
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("adder_4bit_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
