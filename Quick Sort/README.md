### This is the parameterised verilog code for hardware implementation of Quick Sort.
- The code consist of four states and six Modules.
-Shell is the top module which gives the output serially after sorting is finished. All other modules are instantiated and connected with each other here.
-control_path is the finite state machine which generates all the control signals required for functioning of other modules.
-Memory stores the incoming input when machine is in state s1 and stores them in an array. When machine enters in state s2, this array is passed to module sort for sorting.
-Sort module is activated in s2 state and places the pivot element (leftmost element in the array in our case) such that all the elements smaller than pivot are placed on left hand side and all the elements greater than pivot are placed on the right hand side with respect to the pivot element.
-Agrt module is a submodule of Sort. It takes 2 elements as input and compares them. The output is  high  if the first input is greater than second input else the output is low.
-Partition module is the heart if this code. It contains an array called 'ranger'. The first two elements of this array gives the lower and upper limit of the array to be sorted by sort module.
-This array is initialised with ranger[0] = 0 and ranger[1] = K-1, where K is the number of inputs to be fed. After the array is sorted by sort module, it passes the new index of pivot in the partially sorted array.
-Partition module takes this index as input, left shifts the elements of ranger array from index 1 to K-1 and inserts this input index value  at  ranger[1] after decrementing it by one.
-Whenever the difference between the ranger[1] and ranger[0] elements is equal or less than 0, ranger array is right shifted and number '2' is added to the 0th element of this array.
-If the number at 0th position is equal or greater than K-1, the array is assumed to be sorted and machine returns to s0 state until new start signal is applied.

