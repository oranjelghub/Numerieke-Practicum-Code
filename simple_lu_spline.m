function [L,U] = simple_lu_spline(A)

n = size(A,1);

for k=1:n-1

    A(k+1,k) = A(k+1,k) / A(k,k) ;

    if k<n-1

        A(k+1:k+2,k+1:k+2) = A(k+1:k+2,k+1:k+2) - A(k+1:k+2,k) * A(k,k+1:k+2) ;
        
    else

        A(k+1,k+1) = A(k+1,k+1) - A(k+1,k)*A(k+1,k);

    end
end

L = tril(A,-1)+eye(size(A)) ;
U = triu(A) ;

end

