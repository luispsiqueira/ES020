function [t, y] = RA183045_L09_02(A0,T,n)

an = @(n) (4*A0)./((2*n - 1) .* pi);
wn = @(n) (2.*pi*(2*n - 1))/T;

fx = @(t,n) sum(an(1:n) .* sin(wn(1:n) .* t));


figure; hold on;
t = linspace(-4,4,1e4);
n = [1:n];
for j=1:length(n) 
    y = zeros(size(t));
    for i=1:length(t)
        y(i) = fx(t(i),n(j));
    end
    lgd{j} = sprintf('%d pt',n(j));
    plot(t,y)
end
legend(lgd,'location','best')



end