function [m,rho_avg] = RA183045_L10_01()

  r = [0 1100 1500 2450 3400 3630 4500 5380 6060 6280 6380];
  rho = 1e-3 * [13 12.4 12 11.2 9.7 5.7 5.2 4.7 3.6 3.4 3];

  for i=1:11
    f = @(x) 4*pi*rho(i).*x.^2;
    a = 0;
    b = r(11);
    mf(i) = integral(f,a,b);
  end

  m = 4*pi*trapz(r,mf)

  v = 4/3 *pi*r(11)^3;

  rho_avg = m/v


end

%acho que ta errado, precisa arrumar