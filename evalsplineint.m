function [y] = evalsplineint(t,f,tbefore,tafter,k)

%Initiele defs
L = length(t);
y = 1:k;
knp = [tbefore t tafter];

%Stelsel opstellen en oplossen
[A,b] = stelselsplineint(t,f,tbefore,tafter);
coeff = A\b; %Bevat L+2 elementen

%Lijst van equidistante punten
evalpunt = t(1)+((t(L)-t(1))/(k-1)).*(0:k-1);

%Interpolerende veelterm opstellen
for i = 1:length(evalpunt)
    sum = 0;
    for j= 1:length(coeff) 
        sum = sum + coeff(j)*ppval(bspline([knp(j)
                                            knp(j+1)
                                            knp(j+2)
                                            knp(j+3)
                                            knp(j+4)]),evalpunt(i));
    end
    y(i) = sum;
end
end


