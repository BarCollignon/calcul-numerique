function [L,U] = mylu3b(A, n)
  for k = 1 : n-1
    for i = k+1 : n
      A(i,k) = A(i,k) / A(k,k);
    end
    for i = k+1 : n
      for j = k+1 : n
        A(i,j) = A(i,j) - A(i,k) * A(k,j);
      end;
    end;
  end;
  U = triu(A);
  L = tril(A);
endfunction;

function [L,U] = mylu1b(A, n)
  for k=1 : n-1
    A(k+1:n, k) = A(k+1 :n, k) / A(k, k);
    A(k+1 :n, k+1 :n) = A(k+1 :n, k+1:n) - A(k+1 :n, k) * A(k, k+1:n);
  end;
  U = triu(A);
  L = tril(A);
endfunction;

function [L,U,P] = mylu(A, n)
  row = (1,n);
  ldn = speye(n,n);
  P = ldn(row,:);
  for k=1 : n-1
    A(k+1 :n, k) = A(k+1 :n, k) / A(k, k);
    A(k+1 :n, k+1 :n) = A(k+1 :n, k+1:n) - A(k+1 :n, k) * A(k, k+1:n);
    [piv, ind] = max(abs(A(k:n,k)));
    ind = k-1 + ind;
    q = row(1,ind);
    if ind ~= k then
      new = A(ind, :);
      A(ind,:) = A(k, :);
      row(1,ind) = row(1,ind);
      row(1,k) = q;
    end;
  end;
endfunction;
