function [i] = RA183045_L04_03()

A1 = [20 0 -15
    0 20 -5
    -15 -5 40];

A2 = [20 0 -15
    0 25 -10
    -15 -10 45];

A3 = [20 0 -15
    0 35 -20
    -15 -20 55];

b = [220 0 0].';

i1 = A1\b;

i2 = A2\b;

i3 = A3\b;

i = [i1 i2 i3]

end