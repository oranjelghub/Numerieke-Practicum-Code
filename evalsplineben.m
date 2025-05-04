function y = evalsplineben(t, tbefore, tafter, x, f,k)
    %Stelsel opstellen en oplossen
    [A,b] = stelselsplineben(t,tbefore,tafter,x,f);
    coeff = lsqr(A,b,10^(-6),100); %Van dimensie length(T)
    
    %Lijst van equidistante punten
    evalpunt = linspace(t(1),t(end),k);

    y = evalBspline([tbefore t tafter],coeff,evalpunt);
end