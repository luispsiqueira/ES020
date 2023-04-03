function [saida] = RA183045_L02_04(xy)
%Função que retorna uma matriz de uma linha com n colunas,
%sendo n o número de colunas na matriz recebida.
%Nessa matriz, serão alocados 1 e 0, 1 para quando os valores
%de x e y da matriz recebida estiverem no primeiro quadrante
%cartesiano, e 0 caso contrário.

n = length(xy);

vetor_saida = 1:n;

for i=1:n
    x = xy(1,i);
    y = xy(2, i);
    if x >=0 && y >= 0 && x^2 + y^2 <= 1
        vetor_saida(i) = 1;
    else
        vetor_saida(i) = 0;
    end

end

saida= vetor_saida;
end