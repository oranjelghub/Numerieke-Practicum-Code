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

%%

load('opdracht4.mat')

cond1 = t<0.6;
cond2 = t>=0.6 & t<1.2;
cond3 = t>=1.2;

t1 = t(cond1);
t2 = t(cond2);
t3 = t(cond3);

tnew = [t(1) t(6) t(9) t(12) t(14) t(16) t(18) t(20) t(21) t3'];
fnew = [f(1) f(6) f(9) f(12) f(14) f(16) f(18) f(20) f(21) f(length([t1' t2'])+1:length(t),:)'];
tbefore = t(1)+(-3:-1);
tafter = t(end)+(1:3);

x = linspace(t(1),t(end),10000);
y = evalsplineint(t',f', tbefore,tafter,10000);
yalt = evalsplineint(tnew,fnew, tbefore,tafter,10000);

grayColor = [.7 .7 .7];

%subplot(311)
%plot(x,y,'b',t',f','*r', 'MarkerSize',12)
%subplot(312)
%plot(x,yalt,'b',tnew,fnew,'*r', 'MarkerSize',12)
%subplot(313)
plot(x,y-yalt,'r', linspace(t(1),t(end),100),zeros(100), '--g' )
tit = title('Absolute fout tussen de interpolant van vraag 4 en vraag 10');
leg = legend('Absolute fout');
xlab = xlabel('x');
ylab = ylabel('\Deltax');


max(y-yalt)

%%

load('opdracht4.mat')

t1 = linspace(0,0.6,4);
t2 = linspace(0.6,1.2,7);
t3 = linspace(1.2,2,13);
knp = [t1, t2(2:end-1),t3];

x = linspace(knp(1),knp(end),10000);
[A,b] = stelselsplineben(knp,(-3:-1)+knp(1),knp(end)+(1:3), t',f');
y = evalsplineben(knp,(-3:-1)+knp(1),knp(end)+(1:3), t',f',10000);

plot(x,y,'b',t',f','*r', 'MarkerSize',12)
