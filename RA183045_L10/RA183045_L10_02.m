function [L] = RA183045_L10_02()

 f = @(x) sqrt(1 + (cos(x)).^2);
 a = 0;
 b = 48;
 L = integral(f,a,b);
 
end

