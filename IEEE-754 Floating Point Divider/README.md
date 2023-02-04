### This is the parameterised code for floating-point divider
- Shell.v is the main module and there are two sub-modules by the name of divide.v and priority encoder.v
- divide.v uses non-restoring algorithm to divide two N bit numbers.
- priority_encoder.v, as name suggests is a priority encoder implemented using a for-generate loop.
- Since the divide module gives a 2N bit number(for better accuracy) after dividing, N is added to exponent during normalisation phase.
