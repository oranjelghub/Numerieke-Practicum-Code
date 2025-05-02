function [A,b] = stelselsplineben(t, tbefore, tafter, x, f)
        %Wat initiele def
    knpvec = [tbefore t tafter];
    L = length(t); %Dit is n+1 en niet n!
    A = zeros(length(x),L+2);

    %Opbouwen van een lijst van alle B-splines
    iter = 1;
    for i = 1:L
        while iter <= length(x) && x(iter) <= t(i+1)
            A(iter,i:i+2) = [ppval(bspline([knpvec(i),knpvec(i+1),knpvec(i+2),knpvec(i+3),knpvec(i+4)]),x(iter))
                             ppval(bspline([knpvec(i+1),knpvec(i+2),knpvec(i+3),knpvec(i+4),knpvec(i+5)]),x(iter))
                             ppval(bspline([knpvec(i+2),knpvec(i+3),knpvec(i+4),knpvec(i+5),knpvec(i+6)]),x(iter))];
            iter = iter+1;
        end
    end
  
    %Opbouw van b
    b = f';
end
