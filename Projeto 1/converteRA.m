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