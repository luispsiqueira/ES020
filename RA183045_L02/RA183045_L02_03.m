function [Fn] = RA183045_L02_03(n)
%Função que retorna o valor da sequência de Fibonatti
%na posição desejada, que foi mandada para a função (n)

if n == 1 
    Fn = 1;
end

if n == 2
    Fn = 1;
end

s = 0;
i = 1;
j = 1;
control = 2;
if n >= 3
    while(control < n)
        s = i + j;
        i = j;
        j = s;

        control = control + 1;
    end
    Fn = s;
end 

end