function x = Jacobi(A, b, xk)
  F = -triu(A,1);
  E = -tril(A,-1);
  D = diag(diag(A));
  x = inv(D) * (b-A*xk);
endfunction;

function x = Gauss_Seidel(A, b, xk)
  E = -tril(A,-1);
  D = diag(diag(A));
  x = xk + inv(D-E) * (b-A * xk);
endfunction;
