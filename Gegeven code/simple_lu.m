function [L,U] = simple_lu(A)
%%  input:
%    A : matrix
%  output:
%    L,U: L en U matrix

n = size(A,1);

for k=1:n-1
    % Compute L
    A(k+1:end,k) = A(k+1:end,k) / A(k,k) ;
    % Update U
    A(k+1:end,k+1:end) = A(k+1:end,k+1:end) - A(k+1:end,k) * A(k,k+1:end) ;
end

L = tril(A,-1)+eye(size(A)) ;
U = triu(A) ;