clc; clear; close all force

RA = '183045';
d = converteRA(RA);
[L, Izz, M0] = dados(d);

E = 210 * 10^9;
densidade = 7850;

x = L;
Vy = @(P) ((P*L-M0)*x^2/2 - P/6*x^3 + M0/2*sing(x,L/2,2))/(E*Izz);
deflexao_nula = fzero(Vy, 0.01);

P1 = deflexao_nula;
Vy1 = @(x1) ((P1*L-M0).*x1.^2/2 - P1/6.*x1.^3 + M0/2*sing(x1,L/2,2))/(E*Izz);


fzero(Vy1,44)
fplot(Vy1, [0 L])
hold on;
title('Deflexão máxima e mínima')
xlabel('x [m]');
ylabel('Vy(x) [m]');
xmax = fminbnd(@(x) -Vy1(x),0,L);
Vy1max = Vy1(xmax);
xmin = fminbnd(Vy1,0,L);
Vy1min = Vy1(xmin);
plot(xmax,Vy1max,'o','MarkerFaceColor','r');
plot(xmin,Vy1min,'o','MarkerFaceColor','black');
plot(0,0,'o','MarkerFaceColor','g');
plot(15,0,'o','MarkerFaceColor','g');
plot(45,0,'o','MarkerFaceColor','g');
legend('Deflexão da viga', 'Deflexão máxima','Deflexão mínima','Raízes da equação','Location','best');
hold off;