function [x] = RA183045_L04_02()

K = [25 (-5) (-10)
    (-5) 10 (-5)
    (-10) (-5) 15];

W = [100 50 100].';

xx = K\W;

x = xx'

end