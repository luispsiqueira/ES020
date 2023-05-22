%Projeto 1
RA = '183045';
d = converteRA(RA)
[L, Izz, M0] = dados(d)

E = 210 * 10^9;
densidade = 7850;

Mz = @(x) (M0 * x / L) + M0 * sing(x,L/2,0);
fplot(Mz, [0 L])


%% PARTE 0
function [L,Izz,M0] = dados(d)
 %A função calcula o comprimento L em metros, a seção transversal em metros e consequentemente Izz.
 %E por fim, o Momento zero em Newton metro.
 
 
%% Comprimento:
%Calculando L, se os ultimos dois digitos do RA forem zeros, L = 5, caso
%contrário, L = 10d5+d6. Isso em metros (m)
if (d(5) + d(6) == 0)
   L = 5;
else
    L = d(5)*10 + d(6);
end


%% Seção transversal:
%Calculando o valor de b e h, em metros (m)
b = (10*d(3) + 2*d(4))*0.01;
h = 3*b;

Izz = (b*h^3)/12;



%% Carregamento:
%Calculando o valor de M0, em Newton vezes metros (N.m)
M0 = (10*d(1) + d(2))*1000;

end



function [d] = converteRA(RA)
%função que converte o RA lido, que é uma string, em um vetor vertical. No
%qual cada linha é um número do RA.
 x = str2num(RA);
 
 ra = x;
 d1 = (ra/100000) - rem(ra,100000)/100000;
 ra = ra - 100000*d1;
 d2 = (ra/10000) - rem(ra,10000)/10000;
 ra = ra - 10000*d2;
 d3 = (ra/1000) - rem(ra,1000)/1000;
 ra = ra - 1000*d3;
 d4 = (ra/100) - rem(ra,100)/100;
 ra = ra - 100*d4;
 d5 = (ra/10) - rem(ra,10)/10;
 d6 = ra - 10*d5;
 
 d = [d1 d2 d3 d4 d5 d6]';
 
end




%% PARTE 1
function y = sing(x,a,n)
%singularity function: y =<x-a>^n
 b = (x>=a);
 y = (x-a).^n .* (b);

end


%% momento fletor
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

%% Deflexão
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
ylabel('Vy(x) [m]');
grid on
legend('Deflexão - P=0','Deflexão - P=M0/(2*L)','Deflexão - P=M0/L','Deflexão - P=2*M0/L','Location','best');
hold off;
%% Tensão 
P5 = M0/L;
Mz1 = @(x) P5*L - M0 - P5*x + M0 * sing(x,L/2,0);
sigma_xx = @(x,y) -(Mz1(x)*y)/Izz;

b = (10*d(3) + 2*d(4))*0.01;
h = 3*b;

figure
fsurf(sigma_xx, [0 L -h/2 h/2]);
view(2)
title('Tensão na viga');
xlabel('x [m]');
ylabel('y [m]');
legend('\sigma_{xx}(x,y) na viga');


%% Discuta



%% PARTE 2
x = L;
Vy = @(P) ((P*L-M0)*x^2/2 - P/6*x^3 + M0/2*sing(x,L/2,2))/(E*Izz);

figure
fplot(Vy, [0 2*M0/L])
hold on;
ylabel('Vy(x) [m]');
xlabel('P [N]');
%a deflexao da viga será nula no seguinte ponto:
deflexao_nula = fzero(Vy, 0.01)
plot(deflexao_nula, 0,'o',Color='r')
title('Deflexão em função da carga P')
grid on;
legend('Mz - equações', 'Mz máximo')
hold off;


%% Discuta


%% Parte 3

x = L;
Vy = @(P) ((P*L-M0)*x^2/2 - P/6*x^3 + M0/2*sing(x,L/2,2))/(E*Izz);
deflexao_nula = fzero(Vy, 0.01);

P1 = deflexao_nula;
Vy1 = @(x1) ((P1*L-M0).*x1.^2/2 - P1/6.*x1.^3 + M0/2*sing(x1,L/2,2))/(E*Izz);

fplot(Vy1, [0 L])
hold on;
title('Deflexão máxima e mínima')
xlabel('x [m]');
ylabel('Vy(x) [m]');
xmax = fminbnd(@(x) -Vy1(x),0,L);
Vy1max = Vy1(xmax);
xmin = fminbnd(Vy1,0,L);
Vy1min = Vy1(xmin);
plot(xmax,Vy1max,'o',Color='r');
plot(xmin,Vy1min,'o',Color='black');
legend('Deflexão da viga', 'Deflexão máxima','Deflexão mínima');
hold off;

%% Discuta


%% Parte4

RA = '183045';
d = converteRA(RA);
[L, Izz, M0] = dados(d);

E = 210 * 10^9;
densidade = 7850;

b = (10*d(3) + 2*d(4))*0.01;
h = 3*b;
g = 9.81;
w0 = densidade*b*h*g;
P = M0/L;

%Ra Rd Ma
A = [L 0 1
    (3*L/2) 0 1
    1 1 0];

B = [((w0*(L^2)/2)-M0) ((w0*(3*L/2)^2)/2-M0-P*(3*L/2-L)) (w0*(3*L/2)-P)].';

resposta = A\B;

%assumindo w0 = 0
w0_1 = 0;
B1 = [((w0_1*(L^2)/2)-M0) ((w0_1*(3*L/2)^2)/2-M0-P*(3*L/2-L)) (w0_1*(3*L/2)-P)].';
resposta1 = A\B1;

%assumindo w0 = 0 e P = 0
P2 = 0;
B2 = [((w0_1*(L^2)/2)-M0) ((w0_1*(3*L/2)^2)/2-M0-P2*(3*L/2-L)) (w0_1*(3*L/2)-P2)].';
resposta2 = A\B2;


%assumindo w0 = 0 e M0 = 0
M0_1 = 0;
B3 = [((w0_1*(L^2)/2)-M0_1) ((w0_1*(3*L/2)^2)/2-M0_1-P*(3*L/2-L)) (w0_1*(3*L/2)-P)].';
resposta3 = A\B3;


%fazendo a tabela, temos
table1 = table(["Ra" "Rd" "Ma"]',resposta, resposta1, resposta2, resposta3)