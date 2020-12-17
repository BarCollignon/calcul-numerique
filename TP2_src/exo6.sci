exec('TP2_src/Jacobi-Gauss.sci');

function [time, iter, tab_res] = analyse_Jacobi(A, b, n)
  tolerance = 10^(-10);
  max_iter = 10000;
  x0 = zeros(n,1);
  error = norm(b - A*x0) / norm(b);
  i = 1;
  time = 0;
  tab_res = [];
  tab_res(1) = norm(b - A*x0) / norm(b);
  while (error > tolerance) & (i < max_iter)
    tic();
    x0 = Jacobi(A, b, x0);
    time = time + toc();
    tab_res(i+1) = norm(b-A*x0) / norm(b);
    i=i+1;
  end;

  iter = i;
endfunction;

function [time, iter, tab_res] = analyse_Gauss(A, b, n)
  tolerance = 10^(-10);
  max_iter = 10000;
  x0 = zeros(n,1);
  error = norm(b - A*x0) / norm(b);
  i = 1;
  time = 0;
  tab_res = [];
  tab_res(1) = norm(b - A*x0) / norm(b);

  while (error > tolerance) & (i < max_iter)
    tic();
    x0 = Gauss_Seidel(A, b, x0);
    time = time + toc();
    tab_res(i+1) = norm(b-A*x0) / norm(b);
    i=i+1;
  end;

  iter = i;
endfunction;

function analyse()
  A1 = rand(5,5);
  A = diag(diag(A1)) + diag(diag(A1,1), 1) + diag(diag(A1,-1), -1);
  disp(A);
  b = rand(5,1);

  [tJ, iJ, errJ] = analyse_Jacobi(A, b, 5);
  [tG, iG, errG] = analyse_Gauss(A, b, 5);
  disp("Jacobi");
  disp(tJ, iJ);
  disp("Gauss")
  disp(tG, iG);
  //plot analyse random

  // partie poisson, n = 3
  A = zeros(3,3)
  for i = 1 : 3
    A(i,i) = 2;
  end;
  A(1,2) = -1;
  A(2,1) = -1;
  A(3,2) = -1;
  A(2,3) = -1;
  disp(A);

  disp("oui");
  [tJ, iJ] = analyse_Jacobi(A, b, 3);
  [tG, iG] = analyse_Gauss(A, b, 3);

  //plot analyse Poisson
endfunction;
