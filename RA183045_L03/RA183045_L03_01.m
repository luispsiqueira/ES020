function [d] = RA183045_L03_01()

k1 = 40000;
k2 = 40;
m = 95;
g = 9.81;
h = 0.43;

f = @(d) (2*k2*d^(5/2))/5 + (k1*d^2)/2 - (m*g*d) - (m*g*h);
%fplot(f,[0.1 0.2]);

format long;
opt = optimset('display','iter')
d = fzero(f,0.16,opt)


end