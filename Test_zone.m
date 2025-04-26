%Knal hier code dat je wilt uittesten

p = (1:20).^2;
[A,b] = stelselsplineint(p,1:20,(-3:-1).^3,(21:23).^3);


[L,U] = simple_lu(A);
[l,u] = simple_lu_spline(A);


disp(Backsub_U(U,Backsub_L(L,b))-(A\b)')


