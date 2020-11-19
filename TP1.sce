exec('matmat1b.sci');
exec('matmat2b.sci');
exec('matmat3b.sci');

function exo2(N)
  format("e", 16);
  A = rand(N,N);
  xex = rand(N,1);
  b = A*xex;
  x = A\b
  Fresres = norm(x-xex)/norm(xex);
  Brelres = norm(b-A*x) /norm(b);
  disp("Fresres = ",Fresres);
  disp("Brelres = ",Brelres);
  disp("Cond");
  disp(cond(A));
  disp(cond(A) * Brelres);
endfunction

function test_exo3()
  mat_A = testmatrix('magi', 100);
  mat_B = testmatrix('magi', 100);

  tic()
  mat_A * mat_B;
  disp("Temoin = ",toc());
  tic();
  matmat1b(mat_A, mat_B);
  disp("Test1 = ", toc());
  tic();
  matmat2b(mat_A, mat_B);
  disp("Test2 = ", toc());
  tic();
  matmat3b(mat_A, mat_B);
  disp("Test3 = ", toc());
endfunction

//exo2(3);
//exo2(100);
//exo2(1000);
//exo2(10000);

test_exo3();
