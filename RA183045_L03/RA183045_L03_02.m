function [H] = RA183045_L03_02()

v = 5;
t = 2.5;
g = 9.81;
L = 4;

f = @(H) sqrt(2*g*H)* tanh(sqrt(2*g*H/2/L)*t) - v;

%fplot(f,[1.25 1.3]);

format long;
opt = optimset('display','iter')
H = fzero(f,1.2749,opt)


end