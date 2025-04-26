function x = Backsub_U(U,b)

    x = 1:length(b);
    x(end) = b(end)/U(end,end);

    for k = flip(2:length(b)-1)
        
        x(k) = (b(k)-U(k,k+1)*x(k+1))/U(k,k);

    end

    x(1) = (b(1)-U(1,2)*x(2)-U(1,3)*x(3))/U(1,1);

end