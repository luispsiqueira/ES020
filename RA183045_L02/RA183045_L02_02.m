function [r, theta] = RA183045_L02_02(x, y)
%funcao que transforma o valor das coordenadas cartesianas
%em coordenadas polares. retorna o valor de rho primeiro e em
%segundo o valor de theta

r = sqrt(x*x + y*y);

if x > 0 
   theta = atan(y/x);
end 

if x < 0 && y > 0
    theta = atan(y/x) + pi;
end

if x < 0 && y < 0
    theta = atan(y/x) - pi;
end

if x < 0 && y == 0
    theta = pi;
end

if x == 0 && y > 0
    theta = pi / 2;
end

if x == 0 && y < 0
    theta = -pi /2;
end

if x == 0 && y == 0
    theta = 0;
end


end 