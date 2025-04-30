function [L,U] = simple_lu_spline(A)

n = size(A,1);

A(2,1) = A(2,1) / A(1,1) ;
A(2,2) = A(2,2) - A(2,1) * A(1,2) ;
A(2,3) = A(2,3) - A(2,1) * A(1,3) ;

for k=2:n-3
    A(k+1,k) = A(k+1,k) / A(k,k) ;
    A(k+1,k+1) = A(k+1,k+1) - A(k+1,k) * A(k,k+1) ;
end

A(n-1:n,n-2) = A(n-1:n,n-2)/A(n-2,n-2);
A(n-1:n,n-1) = A(n-1:n,n-1) - A(n-1:n,n-2)*A(n-2,n-1);
A(n,n-1) = A(n,n-1)/A(n-1,n-1);
A(n,n) = A(n,n)-A(n,n-1)*A(n-1,n);

L = tril(A,-1)+eye(size(A)) ;
U = triu(A) ;

end

