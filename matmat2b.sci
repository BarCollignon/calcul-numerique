function [C] = matmat2b(A,B)
  C = zeros(length(A(:,1)),length(B(1,:)));
  for i = 1:length(A(:,1))
    for j = 1:length(B(1,:))
      C(i,j) = A(i,:) * B(:,j) + C(i,j);
    end
  end
endfunction
