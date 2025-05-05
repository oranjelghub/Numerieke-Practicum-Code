function y = evalsplineben(t, tbefore, tafter, x, f,k)
    [A,b] = stelselsplineben(t,tbefore,tafter,x,f);
    coeff = A\b;
    evalpunt = linspace(t(1),t(end),k);

    y = evalBspline([tbefore t tafter],coeff,evalpunt);
end