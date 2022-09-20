// Full adder design using verilog primitive gates
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021
// 
// Do not touch the following line it is required for simulation 
// All gates have a 1ns delay (#1 = 1ns)
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

//Module definition

module full_adder(input  wire  a, 
                  input  wire  b, 
                  input  wire  cin, 
                  output wire  s, 
                  output wire  cout);

// Internal connections should be defined here
wire axorb; // Will be the output of a^b
wire ab; // Will be the output of a.b
wire cin_axorb; // Will be the output cin.(a^b)

// Sum logic for full adder s=(a^b)^cin
xor #1 gate1 (axorb, a, b);
xor #1 gate2 (s, cin, axorb);

// Carry logic for full adder cout=cin.(a^b) + a.b
and #1 gate3 (ab, a, b);
and #1 gate4 (cin_axorb, cin, axorb);
or #1 gate5 (cout, cin_axorb, ab);



endmodule 

// for simulation purposes, do not delete
`default_nettype wire
