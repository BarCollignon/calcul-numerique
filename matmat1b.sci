function [C] = matmat1b(A,B)
  for i = 1:length(A(:,1))
    C(i,:) = A(i,:) * B;
  end
endfunction
