module BCDex3Converter

input B0, B1, B2, B3;
output E0, E1, E2, E3;
assign E3 = B3 | B1&B2| B0&B2
assign E2 = B2&~B1&~B0 | ~B2&B0 | B2&B1
assign E1 = ~B1&~B0 | B1&B0
assign E0 = ~B0

endmodule
