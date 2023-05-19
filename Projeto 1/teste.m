clc; clear; close all force

RA = '183045';
d = converteRA(RA);
[L, Izz, M0] = dados(d);

E = 210e9;
densidade = 7850;

P = M0/L;


%momento fletor
%metodo 1 - usando singularidade
Mz = @(x) P*L - M0 - P*x + M0 * sing(x,L/2,0);

%metodo 2 - usando equacoes a partir do valor de x
x = [0:0.01:L];
for a = 1:length(x)
    if x(a) < L/2
        Mz2(a) = P*(L-x(a)) - M0;
    else
        Mz2(a) = P*(L-x(a));
    end
end

%fazendo o grafico
%pode-se observar que a mistura dos dois gráficos, um azul e o outro
%vermelho, geraram um gráfico roxo
figure
fplot(Mz, [0 L], 'b','LineWidth',2);
hold on;
title('Momento fletor pelo comprimento')
ylabel('Mz(x) [N.m]');
xlabel('x [m]');
plot(x, Mz2,'r','LineWidth',1);
grid on;
plot(L/2, Mz(L/2),'o',Color='g');
plot(L/2, -Mz(L/2),'o',Color='g');
legend('Mz - singularidade', 'Mz - equações','Mz máximo')
hold off;

%para melhor visualizacao dos graficos
figure
subplot(2,1,1);fplot(Mz, [0 L], 'b')
hold on;
ylabel('Mz(x) [N.m]');
xlabel('x [m]');
title('Momento fletor pelo comprimento - singularidade')
grid on;
plot(L/2, Mz(L/2),'o',Color='g')
plot(L/2, -Mz(L/2),'o',Color='g')
legend('Mz - singularidade', 'Mz máximo')
hold off;

subplot(2,1,2);plot(x, Mz2,'r');
hold on;
ylabel('Mz(x) [N.m]');
xlabel('x [m]');
title('Momento fletor pelo comprimento - equações')
grid on;
plot(L/2, Mz(L/2),'o',Color='g')
plot(L/2, -Mz(L/2),'o',Color='g')
legend('Mz - equações', 'Mz máximo')
hold off;



figure
%Deflexão
Vy = @(x) ((P*L-M0).*x.^2/2 - P/6.*x.^3 + M0/2*sing(x,L/2,2))/(E*Izz);

P1 = 0;
Vy1 = @(x) ((P1*L-M0).*x.^2/2 - P1/6.*x.^3 + M0/2*sing(x,L/2,2))/(E*Izz);
fplot(Vy1,[0 L]);

hold on;

P2 = M0/L/2;
Vy2 = @(x) ((P2*L-M0).*x.^2/2 - P2/6.*x.^3 + M0/2*sing(x,L/2,2))/(E*Izz);
fplot(Vy2,[0 L]);

P3 = M0/L;
Vy3 = @(x) ((P3*L-M0).*x.^2/2 - P3/6.*x.^3 + M0/2*sing(x,L/2,2))/(E*Izz);
fplot(Vy3,[0 L]);

P4 = 2*M0/L;
Vy4 = @(x) ((P4*L-M0).*x.^2/2 - P4/6.*x.^3 + M0/2*sing(x,L/2,2))/(E*Izz);
fplot(Vy4,[0 L]);

title('Deflexão da viga');
xlabel('x [m]');
ylabel('Vy(x) [N]');
grid on
legend('Deflexão - P=0','Deflexão - P=M0/(2*L)','Deflexão - P=M0/L','Deflexão - P=2*M0/L','Location','best');
hold off;




%TENSÃO
P5 = M0/L;
Mz1 = @(x) P5*L - M0 - P5*x + M0 * sing(x,L/2,0);
sigma_xx = @(x,y) -(Mz1(x)*y)/Izz;

b = (10*d(3) + 2*d(4))*0.01;
h = 3*b*1e-2;

figure
fsurf(sigma_xx, [0 L -h/2 h/2]);
view(2)
title('Tensão na viga');
xlabel('x [m]');
ylabel('y [m]');
legend('\sigma_{xx}(x,y) na viga');

