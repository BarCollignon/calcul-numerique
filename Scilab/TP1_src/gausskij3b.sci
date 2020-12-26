exec('TP1_src/solve.sci');

function x = gauss3b(A, b, n)
  for k= 1:n-1
    for i = k+1 : n
      mik = A(i,k)/A(k,k);
      b(i) = b(i) - mik * b(k);
      for j = k+1 : n
        A(i,j) = A(i,j) - mik * A(k,j);
      end
    end
  end
  x = usolve(A, b, n);
endfunction;

function x = gauss1b(A, b, n)
  m = zeros(n);
  for k= 1:n-1
    mik(k+1:n) = A(k+1:n,k)/A(k,k);
    b(k+1:n) = b(k+1:n) - mik(k+1:n) * b(k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - mik(k+1:n) * A(k,k+1:n);
  end
  x = usolve(A, b, n);
endfunction;
