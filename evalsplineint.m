function [y] = evalsplineint(t,f,tbefore,tafter,k)

%Stelsel opstellen en oplossen
[A,b] = stelselsplineint(t,f,tbefore,tafter);
coeff = A\b;

%Lijst van equidistante punten
evalpunt = linspace(t(1),t(end),k);

y = evalBspline([tbefore t tafter],coeff,evalpunt);
end

