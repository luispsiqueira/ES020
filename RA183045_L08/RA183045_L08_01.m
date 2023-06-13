%function [K, m] = RA183045_L08_01()


F = [24.6 29.3 31.5 33.3 34.8 35.7 36.6 37.5 38.8 39.6 40.4] * 1e3.';
L = [12.58 12.82 12.91 12.95 13.05 13.21 13.35 13.49 14.08 14.21 14.48]* 1e-3.';

A0 = 1.25e-4;
L0 = 0.0125;



%tensão verdadeira (sigma_v)
%deformação verdadeira (Ev)
for i=1:length(F)
    sigma_v(i) = F(i)*L(i)/A0/L0;
    Ev(i) = log(L(i)/L0)
end

figure;
%plot(sigma_v,Ev,'o');
Et = [Ev.' ones(length(Ev),1)];
sigma_t = log(Ev./sigma_v).';

M = Et\sigma_t
K = M(2);
m = M(1);
hold on

fplot(@(Ev) K.*Ev^m,[min(Ev) max(Ev)]);

hold off;

%end