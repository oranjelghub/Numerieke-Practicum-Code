%Je kan hier variabele def en de functies uitproberen

t = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
tbefore = [-2,-1,0];
tafter = [15,16,17];

f = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];

[A,b] = stelselsplineint(t,f,tbefore,tafter);
%disp(A)
%disp(b)
%disp(A\b)
%length(A\b)


evalsplineint(t,f,tbefore,tafter,20)
