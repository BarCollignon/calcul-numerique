function x = Jacobi(A, b, xk)
  //F = -triu(A,1);
  //E = -tril(A,-1);
  D = diag(diag(A));
  x = inv(D) * (b-A*xk);
endfunction;

function x = Gauss_Seidel(A, b, xk)
  E = -tril(A,-1);
  D = diag(diag(A));
  x = xk + inv(D-E) * (b-A * xk);
endfunction;

function [x0, error, iter] = Jacobi_donne(A, b, tolerance, maxit)
  n = size(A, 1);
  x0 = zeros(n, 1);
  iter = 1;
  error = [];
  error(1) = norm(b-A*x0) / norm(b);
  Dm1 = (1.) / diag(A);
  while (error(iter) > tolerance) & (iter < maxit)
    iter = iter +1;
    x0 = x0 + Dm1 * b-A*x0;
    error(iter) = norm(b-A*x0) / norm(b);
  end;
endfunction;
