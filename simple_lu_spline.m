function [L,U] = simple_lu_spline(A)

A(2,1) = A(2,1) / A(1,1) ;
A(2,2) = A(2,2) - A(2,1) * A(1,2) ;
A(2,3) = A(2,3) - A(2,1) * A(1,3) ;

for k=2:size(A,1)-3
    A(k+1,k) = A(k+1,k) / A(k,k) ;
    A(k+1,k+1) = A(k+1,k+1) - A(k+1,k) * A(k,k+1) ;
end

A(end-1:end,end-2) = A(end-1:end,end-2)/A(end-2,end-2);
A(end-1:end,end-1) = A(end-1:end,end-1) - A(end-1:end,end-2)*A(end-2,end-1);
A(end,end-1) = A(end,end-1)/A(end-1,end-1);
A(end,end) = A(end,end)-A(end,end-1)*A(end-1,end);

L = tril(A,-1)+eye(size(A)) ;
U = triu(A) ;

end

