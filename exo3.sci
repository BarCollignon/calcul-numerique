exec('matmat.sci');

function temps = test_exo3(n)
  mat_A = rand(n, n);
  mat_B = rand(n, n);
  Tmoyen = 0;
  moy1 = 0;
  moy2 = 0;
  moy3 = 0;
  for i = 1 : 1000
    tic();
    mat_A * mat_B;
    Tmoyen = Tmoyen + toc();
    tic();
    matmat1b(mat_A, mat_B);
    moy1 = moy1 + toc();
    tic();
    matmat2b(mat_A, mat_B);
    moy2 = moy2 + toc();
    tic();
    matmat3b(mat_A, mat_B);
    moy3 = moy3 + toc();
  end
  Tmoyen = Tmoyen / 1000;
  moy1 = moy1 / 1000;
  moy2 = moy2 / 1000;
  moy3 = moy3 / 1000;
  temps = [Tmoyen, moy1, moy2, moy3];
endfunction

function analyse_exo3()
  moy = zeros(4,9);
  // moy = [Temoin; moy1 ; moy2; moy3]
  test = test_exo3(10);
  moy(1,1) = test(1);
  moy(2,1) = test(2);
  moy(3,1) = test(3);
  moy(4,1) = test(4);
  index_moy = 2;
  for i = 50 : 400
    test = test_exo3(i);
    moy(1,index_moy) = test(1);
    moy(2,index_moy) = test(2);
    moy(3,index_moy) = test(3);
    moy(4,index_moy) = test(4);
  end
  plot([10,100,150,200,250,300,350,400],[moy(1) moy(2) moy(3) moy(4)]);
endfunction
