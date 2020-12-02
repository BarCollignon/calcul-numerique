exec("factorisation.sci");

function [Error3b, Error1b, T3, T1] = test_exo6(n)
  format("e", 16);
  fre = ones(n,n);
  A = rand(n,n);
  tic();
  for i = 1:10
    [L, U] = mylu3b(A, n);
  end;
  T3 = toc() / 10;
  tic();
  for i = 1:10
    [L1, U1] = mylu1b(A, n);
  end;
  T1 = toc() / 10;
  Error3b = variancef(A - L*U,fre);
  Error1b = variancef(A - L1*U1,fre);
endfunction;

function analyse_exo6()
  Error3b = [];
  Error1b = [];
  T3 = [];
  T1 = [];
  x_val = [];
  c = 1;
  for i = 10 : 10 : 100
    x_val(c) = i;
    [E3, E1, t3, t1] = test_exo6(i);
    Error3b(c) = E3;
    Error1b(c) = E1;
    T3(c) = t3;
    T1(c) = t1;
    c = c+1;
  end;
  scf(0);
  plot(x_val, Error3b);
  plot(x_val, Error1b, 'cya');
  scf(1);
  plot(x_val, T3);
  plot(x_val, T1, 'cya');
endfunction;
