function [meu_atan] = RA183045_L02_01(x, eps)
%Função que é capaz de calcular o valor do angulo
%referente ao valor da tangente enviado.
%O valor de e, quanto menor (mais próximo de zero, positivo), 
%mais preciso vai ser o valor do angulo que será encontrado.

termo = 1;
soma = 0;
n = 0;
sinal = -1;
y = x;
if x < -1 || x > 1
    x = 1/x;
end

z = x;
while(eps < abs(termo))
    sinal = -sinal;
    
    termo = z/(2*n + 1);
    soma = soma + (sinal * termo);
    z = z*x*x;
    n = n + 1;
end


if y >= -1 && y <= 1
    meu_atan = soma;
else 
    meu_atan = pi/2 - soma;
end

end