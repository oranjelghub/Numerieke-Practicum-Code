function y = evalsplineben(t, tbefore, tafter, x, f,k)
    [A,b] = stelselsplineben(t,tbefore,tafter,x,f);
    coeff = lsqr(A,b,10^(-6),100);
    evalpunt = linspace(t(1),t(end),k);

    y = evalBspline([tbefore t tafter],coeff,evalpunt);
end