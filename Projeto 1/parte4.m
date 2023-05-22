clc; clear; close all force;


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