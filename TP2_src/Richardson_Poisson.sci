function [x, relres, resvec, it] = richardson_Poisson(A, b, tol, maxit, x0, alpha)
  it = 0;
  res = b - A*x0;
  relres = norm(res)/norm(b);
  while(relres > tol) & (it < maxit)
    it = it +1;
    x = x0 + alpha * res ;
    res = b - A*x;
    relres = norm(res) / norm(b);
    resvec(it) = relres;
    x0 = x;
  end;
endfunction;
