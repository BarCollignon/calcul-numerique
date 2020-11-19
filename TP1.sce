
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

exo2(3);
exo2(100);
exo2(1000);
