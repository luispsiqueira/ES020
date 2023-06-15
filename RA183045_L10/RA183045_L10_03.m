function [v_206, a_206] = RA183045_L10_03()
  t = [200 202 204 206 208 210];
  theta = [0.75 0.72  0.7 0.68 0.67 0.66];
  r = [5120 5370 5560 5800 6030 6240];

  r1 = diff(r);
  r2 = diff(r1);
  theta1 = diff(theta);
  theta2 = diff(theta1);

  v_206 = [r1(4) (r(4)*theta1(4))].';
  a_206 = [(r2(4)-r(4)*theta1(4).^2) (r(4)*theta2(4)+2*r1(4)*theta1(4))].';

end