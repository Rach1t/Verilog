+ **Here is the parameterised code for Koggge-Stone Adder.**
+ For implementing the kogge-stone, an array on N*M is taken. Here, N is the number of bits of input and M is the least integer greater than or equal to logarithm to base  2 of N (i.e LIF(log<sub>2</sub>N)).
+ The first row of this row contains generate and propogate terms.
+ The carry tree is then implemented using two for-generate loops.
+ Sum and carry outputs are computed in post-processing step. Here possibility of input carry is also taken care of.
