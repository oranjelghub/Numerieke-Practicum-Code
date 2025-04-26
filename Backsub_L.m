function x = Backsub_L(L,b)

    x = 1:length(b);
    x(1) = b(1)/L(1,1);

    for k = 2:length(b)-1
        
        x(k) = (b(k)-L(k,k-1)*x(k-1))/L(k,k);

    end

    x(end) = (b(end)-L(end,end-1)*x(end-1)-L(end,end-2)*x(end-2))/L(end,end);

end