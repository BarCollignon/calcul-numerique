exec('gausskij3b.sci');

function values = exo5(n)
  values = [];
  A = rand(n,n);
  b = rand(n,1);
  x = A\b;
  xex = gauss3b(A,b,n);
  values(1) = norm(x-xex)/norm(x);
  values(2) = norm(b - (A*xex)) / (norm(A)*norm(xex));
endfunction;

function analyse_exo5()
  temps = [];
  Fret = [];
  Bret = [];
  x_val = [];
  compteur = 1;
  val = [];
  for i = 10 : 10 : 100
    x_val(compteur) = i;
    tic();
    val = exo5(i);
    temps(compteur) = toc();
    Fret(compteur) = val(1);
    Bret(compteur) = val(2);
    compteur = compteur +1;
  end;
  plot(x_val, temps);
  scf(2);
  plot(x_val, Fret, 'cya');
  plot(x_val, Bret);
endfunction;
