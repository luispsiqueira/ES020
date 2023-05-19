function [L,Izz,M0] = dados(d)
 %A função calcula o comprimento L em metros, a seção transversal em metros e consequentemente Izz.
 %E por fim, o Momento zero em Newton metro.
 
 
%Comprimento:
%Calculando L, se os ultimos dois digitos do RA forem zeros, L = 5, caso
%contrário, L = 10d5+d6. Isso em metros (m)
if (d(5) + d(6) == 0)
   L = 5;
else
    L = d(5)*10 + d(6);
end


%Seção transversal:
%Calculando o valor de b e h, em metros (m)
b = (10*d(3) + 2*d(4))*0.01;
h = 3*b;

Izz = (b*h^3)/12;



%Carregamento:
%Calculando o valor de M0, em Newton vezes metros (N.m)
M0 = (10*d(1) + d(2))*1000;

end