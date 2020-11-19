function [x] = usolve(U, b)
  n = length(U(1,:));
  x = zero(n);
  x(n) = b(n) / U(n,n);
  for i = n-1 : -1 : 1
    x(i) = (b(i) - U(i,(i+1) : n) * x((i+1) : n) / U(i,i);
  end
endfunction

function [x] = lsolve(L, b)
  n = length(L(1,:));
  x = zeros(n);
  x(1) = b(1) / L(1,1);
  for i = 1:n
    x(i) = (b(i) - L(i, 1:(i-1)) * x(1:(i-1))) / L(i,i);
  end
endfunction
