load('Documents/Matlab stuff/Numerieke Practicum/Gegeven code/opdracht4.mat')

cond1 = t<0.6;
cond2 = t>=0.6 & t<1.2;
cond3 = t>=1.2;

t1 = t(cond1);
t2 = t(cond2);
t3 = t(cond3);

disp(t1)

disp(t2)

disp(t3)
