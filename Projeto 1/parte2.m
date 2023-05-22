clc; clear; close all force

RA = '183045';
d = converteRA(RA);
[L, Izz, M0] = dados(d);

E = 210e9;
densidade = 7850;

x = L;
Vy = @(P) ((P*L-M0)*x^2/2 - P/6*x^3 + M0/2*sing(x,L/2,2))/(E*Izz);

figure
fplot(Vy, [0 2*M0/L])
hold on;
ylabel('Vy(P) [m]');
xlabel('P [N]');
%a deflexao da viga será nula no seguinte ponto:
deflexao_nula = fzero(Vy, 1)
plot(deflexao_nula, 0,'o','MarkerFaceColor','r')
title('Deflexão em função da carga P')
grid on;
legend('Vy(P)', 'VY nulo')
hold off;

