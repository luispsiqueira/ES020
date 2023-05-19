function y = sing(x,a,n)
%singularity function: y =<x-a>^n
 b = (x>=a);
 y = (x-a).^n .* (b);

end
