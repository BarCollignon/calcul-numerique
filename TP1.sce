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

//exo2(3);
//exo2(100);
//exo2(1000);
//exo2(10000);

mat_A = [2 1 1; 1 2 1 ; 1 1 2];
mat_B = [3 3 3; 1 1 1 ; 2 2 2];

disp("Temoin =",mat_A * mat_B);
disp(matmat1b(mat_A, mat_B));
disp(matmat2b(mat_A, mat_B));
disp(matmat3b(mat_A, mat_B));
