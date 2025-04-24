function [A,b] = stelselsplineint(t, f, tbefore, tafter)

    %Wat initiele def
    knpvec = [tbefore t tafter];
    L = length(t); %Dit is n+1 en niet n!
    A = zeros(L+2);

    %Opbouwen van een lijst van alle B-splines
    for i = 1:L
        A(i+2,i:i+2) = [ppval(bspline([knpvec(i),knpvec(i+1),knpvec(i+2),knpvec(i+3),knpvec(i+4)]),t(i))
                      ppval(bspline([knpvec(i+1),knpvec(i+2),knpvec(i+3),knpvec(i+4),knpvec(i+5)]),t(i))
                      ppval(bspline([knpvec(i+2),knpvec(i+3),knpvec(i+4),knpvec(i+5),knpvec(i+6)]),t(i))];
    end
   
    %Randvoorwaardes voor de afgeleides
    A(1,1:3) = [ppval(fnder(bspline([knpvec(1),knpvec(2),knpvec(3),knpvec(4),knpvec(5)]),2),t(1))
                ppval(bspline([knpvec(2),knpvec(3),knpvec(4),knpvec(5),knpvec(6)]),t(1))
                ppval(bspline([knpvec(3),knpvec(4),knpvec(5),knpvec(6),knpvec(7)]),t(1))];

    A(2,L:L+2) = [ppval(fnder(bspline([knpvec(L),knpvec(L+1),knpvec(L+2),knpvec(L+3),knpvec(L+4)]),2),t(L))
                  ppval(fnder(bspline([knpvec(L+1),knpvec(L+2),knpvec(L+3),knpvec(L+4),knpvec(L+5)]),2),t(L))
                  ppval(fnder(bspline([knpvec(L+2),knpvec(L+3),knpvec(L+4),knpvec(L+5),knpvec(L+6)]),2),t(L))];

    %Opbouw van b
    b = [[0,0] f]';
end


