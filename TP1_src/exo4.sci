exec('TP1_src/solve.sci');

function exo4(N)
  format("e", 16);
  disp("lower");
  A = tril(rand(N,N));
  b = rand(N,1);
  xex = lsolve(A, b, N);
  x = A\b;
  Fresres = norm(x-xex) / norm(x);
  Brelres = norm(b - (A*xex)) / (norm(A)*norm(xex));
  disp("Fresres = ",Fresres);
  disp("Brelres = ",Brelres);
  disp("Cond");
  disp(cond(A));
  disp("upper");
  A = triu(rand(N,N));
  b = rand(N,1);
  xex = usolve(A, b, N);
  x = A\b;
  Fresres = norm(x-xex) / norm(x);
  Brelres = norm(b - (A*xex)) / (norm(A)*norm(xex));
  disp("Fresres = ",Fresres);
  disp("Brelres = ",Brelres);
  disp("Cond");
  disp(cond(A));
endfunction;


function analyse_exo4()
  exo4(10);
  exo4(100);
  exo4(1000);
  exo4(10000);
endfunction
