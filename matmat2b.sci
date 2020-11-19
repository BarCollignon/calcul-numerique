function [C] = matmat2b(A,B)
  for i = 1:length(A(:,1))
    for j = length(B(1,:))
      C(i,j) = A(i,:) * B(:,j);
    end
  end
endfunction
