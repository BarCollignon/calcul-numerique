function [C] = matmat3b(A, B)
  C = zeros(length(A(:,1)),length(B(1,:)));
  for i = 1 : length(A(:,1))
    for j = 1: length(B(1,:))
      for k = 1 : length(B(:,1))
        C(i,j) = A(i,k) * B(k,j) + C(i,j);
      end
    end
  end
endfunction
