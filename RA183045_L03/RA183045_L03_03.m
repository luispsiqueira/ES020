function [h] = RA183045_L03_03()
%função que calcula a altura h, referente a parte da esfera que fica para
%fora da água.

%sabemos que no momento da figura, temos que Peso = Empuxo, ou seja, mg=dvg
%com isso, temos que a massa da da esfera é igual ao volume vezes a
%densidade.
% m = dv
%d_esfera * v_total = d_agua * v_parcial
%em que v_parcial = v_total - v_submerço
%d_esfera * (4*pi*r^3)/3 = d_agua * ((4*pi*r^3)/3 - (pi*h^2)/3 * (3*r - h))
%d_esfera * (4*r^3) = d_agua * ((4*r^3) - (h^2) * (3*r - h))
%d_esfera * (4*r^3) - d_agua * ((4*r^3) - (h^2) * (3*r - h)) = 0

d_esfera = 200;
r = 1;
d_agua = 1000;

f = @(h) d_esfera * (4*r^3) - d_agua * ((4*r^3) - (h^2) * (3*r - h))

%fplot(f,[1 2]);

format long;
opt = optimset('display','iter')
h = fzero(f,1.4257,opt)

end 