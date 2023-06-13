function [A0, A1, B1, C1, dia_max] = RA183045_L09_01()

t = [15 45 75 105 135 165 195 225 255 285 315 345].'; %dias
T = [3.4 4.7 8.5 11.7 16 18.7 20.5 19.7 17.1 12.7 7.7 5.1].'; %graus celcius
figure;
plot(t,T,'o')
 

%periodo => per = 2*pi/omega
periodo = 365; %dias
w0 = 2*pi/periodo;

Z = [ones(length(t),1) cos(w0*t) sin(w0*t)];

a = Z\(T);

T_ajuste = @(t) a(1) + a(2)*cos(w0*t) + a(3)*sin(w0*t) ;
hold on
fplot(T_ajuste, [min(t) max(t)], '--', 'linewidth', 2);


A0 = a(1);
A1 = a(2);
B1 = a(3);

C1 = sqrt((A1)^2 + (B1)^2);

dia_max = fminbnd(@(t) -T_ajuste(t), 0, 365)


end