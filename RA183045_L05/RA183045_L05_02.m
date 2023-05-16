function [theta] = RA183045_L05_02()

f = @(x) [150*cosd(x(1))+180*cosd(x(2))-200*cosd(75)-200
    150*sind(x(1))+180*sind(x(2))-200*sind(75)]


x0 = [1 1].'; % estimativa inicial
x = fsolve(f,x0);

theta1 = x(1);
theta2 = x(2);

theta = [theta1 theta2].'

end