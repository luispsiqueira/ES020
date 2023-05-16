function [v, theta, t] = RA183045_L05_03()

f = @(x) [x(1)*cosd(x(2))*x(3) - 300
    x(1)*sind(x(2))*x(3) - 0.5*9.81*x(3)^2 - 61
    x(1)*sind(x(2)) - 9.81*x(3) - x(1)*cosd(x(2))*tand(-45)];

x0 = [1 1 1].'; % estimativa inicial
x = fsolve(f,x0);

v = x(1)
theta = x(2)
t = x(3)

end