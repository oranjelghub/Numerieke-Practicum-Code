%%
bspline([0,0.5,2,3,4])

%%
load('opdracht4.mat')

x = linspace(t(1),t(end),10000);
y = evalsplineint(t',f',t(1)+(-3:-1),t(end)+(1:3),10000);

plot(x,y,'b',t',f','*r', 'MarkerSize',12)
title('Sexy Spline interpolatie')
legend('Interpolant','Datapunten')
xlabel('x')
ylabel('f(x)')

%%

p = (1:10).^2;
[A,b] = stelselsplineint(p,1:20,(-2:0).^3,(11:13).^3);
[L,U] = simple_lu(A);


spy(A, 70)
tit = title('A');
tit.FontSize = 20;
lgd = legend('Niet nul elementen');
lgd.FontSize = 20;
xlab = xlabel('Kollom index van element van A');
ylab = ylabel('Rij index van element van A');
xlab.FontSize = 20;
ylab.FontSize = 20;
grid on
xticks((1:12))
yticks((1:12))

figure
subplot(121)
spy(L, 50)
lgd2 = legend('Niet nul elementen');
lgd2.FontSize = 15;
xlab2 = xlabel('Kollom index van element van L');
ylab2 = ylabel('Rij index van element van L');
xlab2.FontSize = 15;
ylab2.FontSize = 15;
grid on
xticks((1:12))
yticks((1:12))

subplot(122)
spy(U, 50)
lgd3 = legend('Niet nul elementen');
lgd3.FontSize = 15;
xlab3 = xlabel('Kollom index van element van U');
ylab3 = ylabel('Rij index van element van U');
xlab3.FontSize = 15;
ylab3.FontSize = 15;
grid on
xticks((1:12))
yticks((1:12))

%%

p = (1:10).^2;
[A,b] = stelselsplineint(p,1:10,(-3:-1),(101:103));
[L,U] = simple_lu_spline(A);
disp((norm((A\b)' - Backsub_U(U,Backsub_L(L,b)))) / norm((A\b)'))