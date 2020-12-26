exec('TP2_src/Richardson_Poisson.sci');

function analyse_7()
  tol = 10^-8;
  maxit = 10000;
  //Poisson 10x10
  A = [];
  b = rand(10,1);
  x0 = zeros(10,1);
  for i = 1:10
    A(i,i) = 2;
  end;
  for i = 1 : 9
    A(i, i+1) = -1;
    A(i+1, i) = -1;
  end;
  tab_iter = 1:1:maxit;
  for alpha = 0.1 : 0.1 : 0.9
    [x, relres, resvec, it] = richardson_Poisson(A, b, tol, maxit, x0, alpha);
    disp(it);
    //plot(tab_iter, resvec, rgb2name(alpha,alpha,alpha));
  end;
endfunction;
