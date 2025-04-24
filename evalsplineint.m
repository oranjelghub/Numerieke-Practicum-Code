function [y] = evalsplineint(t,f,tbefore,tafter,k)

%Initiele defs
L = length(t);
y = 1:k;

%Stelsel opstellen en oplossen
[A,b] = stelselsplineint(t,f,tbefore,tafter);
coeff = A\b;

%Lijst van equidistante punten
evalpunt = t(1)+((t(L)-t(1))/(k-1)).*(0:k-1);

%Interpolerende veelterm opstellen
for i = 1:L
    sum = 0;
    for j= 1:L %Moet andere indices zijn want niet de tijd gehad om te zien hoeveel coefficienten er waren
        sum = sum + coeff(j);
    end
    y(i) = sum;
end



end


