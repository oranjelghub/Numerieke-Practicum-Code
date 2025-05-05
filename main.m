%% Vraag 2
bspline([0,0.5,2,3,4])

%% Vraag 4
load('opdracht4.mat')

x = linspace(t(1),t(end),10000);
y = evalsplineint(t',f',t(1)+(-3:-1),t(end)+(1:3),10000);

plot(x,y,'b',t',f','*r', 'MarkerSize',8)
title('Sexy Spline interpolatie')
legend('Interpolant','Datapunten','Location','northwest')
xlabel('x')
ylabel('y')

%% Vraag 5
x = (1:10).^2;
A = stelselsplineint(x,1:20,-2:0,101:103);
[L,U] = simple_lu_spline(A);

%Figuur van A
spy(A, 30)
tit = title('Matrix A');
lgd = legend('Niet-nulelementen');
xlab = xlabel('Kolomindex van element van A');
ylab = ylabel('Rij-index van element van A');

tit.FontSize = 15;
lgd.FontSize = 15;
xlab.FontSize = 15;
ylab.FontSize = 15;

grid on
xticks((1:12))
yticks((1:12))

%Figuur van L en U
figure

subplot(121)
spy(L, 20)

tit = title('Matrix L');
lgd = legend('Niet-nulelementen');
xlab = xlabel('Kollom index van element van L');
ylab = ylabel('Rij index van element van L');

tit.FontSize = 10;
lgd.FontSize = 8;
xlab.FontSize = 8;
ylab.FontSize = 8;

grid on
xticks((1:12))
yticks((1:12))

subplot(122)
spy(U, 20)

tit = title('Matrix U');
lgd = legend('Niet-nulelementen');
xlab = xlabel('Kollom index van element van U');
ylab = ylabel('Rij index van element van U');

tit.FontSize = 10;
lgd.FontSize = 8;
xlab.FontSize = 8;
ylab.FontSize = 8;

grid on
xticks((1:12))
yticks((1:12))

%% Vraag 7 (Data en grafieken)
timevec_luspline = 1:181;
timevec_lu = 1:181;
index = 1;

%Rekentijden voor simple_lu_spline
for i = 200:10:2000
    onedim_times = 1:10;
    x = 1:i;

    for j = 1:10
        f = rand(i,1)';
        A = stelselsplineint(x,f,(-3:-1)+x(1),x(end)+(1:3));

        tic
        [C,d] = simple_lu_spline(A);
        onedim_times(j) = toc;
    end
    timevec_luspline(index) = mean(onedim_times);
    index = index+1;

end
index = 1;

%Rekentijden voor simple_lu_spline
for i = 200:10:2000
    onedim_times = 1:10;
    x = 1:i;

    for j = 1:10
        f = rand(i,1)';
        A = stelselsplineint(x,f,(-3:-1)+x(1),x(end)+(1:3));
        tic
        [C,d] = simple_lu(A);
        onedim_times(j) = toc;
    end
    timevec_lu(index) = mean(onedim_times);
    index = index+1;

end

%Figuren genereren
figure

%Logaritmische plot
subplot(121)
semilogy(200:10:2000,timevec_lu,200:10:2000,timevec_luspline)

tit = title('Rekentijd t.o.v. dimensie (logaritmische schaal)');
lgd = legend('Simple lu','Simple lu spline');
xlab = xlabel('Dimensie van de matrices');
ylab = ylabel('Gemmiddelde rekentijd (s)');

tit.FontSize = 12;
lgd.FontSize = 15;
xlab.FontSize = 15;
ylab.FontSize = 15;

%Normale plot
subplot(122)
plot(200:10:2000,timevec_lu,200:10:2000,timevec_luspline)

tit = title('Rekentijd t.o.v. dimensie ');
lgd = legend('Simple lu','Simple lu spline');
xlab = xlabel('Dimensie van de matrices');
ylab = ylabel('Gemiddelde rekentijd (s)');

tit.FontSize = 12;
lgd.FontSize = 15;
xlab.FontSize = 15;
ylab.FontSize = 15;

%% Vraag 7 (Rekencomplixeit)

%% Vraag 9
x = (1:10).^2;
A = stelselsplineint(x,1:20,-2:0,101:103);
[L,U] = simple_lu_spline(A);

%Relatieve fout op het antwoord bekomen door de backslashoperator
disp((norm((A\b)' - Backsub_U(U,Backsub_L(L,b)))) / norm((A\b)'))

%% Vraag 10
load('opdracht4.mat')

%Nieuwe knooppunten
t1 = t(t<0.6);
t2 = t(t>=0.6 & t<1.2);
t3 = t(t>=1.2);
tnew = [t(1) t(6) t(9) t(12) t(14) t(16) t(18) t(20) t(21) t3'];
fnew = [f(1) f(6) f(9) f(12) f(14) f(16) f(18) f(20) f(21) f(length([t1' t2'])+1:length(t),:)'];

x = linspace(t(1),t(end),1000);
y = evalsplineint(t',f', t(1)+(-3:-1),t(end)+(1:3),1000);
y_alt = evalsplineint(tnew,fnew, t(1)+(-3:-1),t(end)+(1:3),1000);

%Figuur
figure
plot(x,abs(y-y_alt),'r')
tit = title('Absolute waarde van de absolute fout tussen de interpolant van vraag 4 en vraag 10');
lgd = legend('Absolute waarde van de absolute fout');
xlab = xlabel('x');
ylab = ylabel('|\Deltax|');

tit.FontSize = 15;
lgd.FontSize = 15;
xlab.FontSize = 20;
ylab.FontSize = 20;

%Maximale absolute fout
max(y-y_alt)

%% Vraag 12
load('opdracht4.mat')

t1 = linspace(0,0.6,4);
t2 = linspace(0.6,1.2,7);
t3 = linspace(1.2,2,13);

knopen = [t1, t2(2:end-1),t3];
x = linspace(knp(1),knopen(end),10000);
y = evalsplineint(t',f',(-3:-1)+t(1),t(end)+(1:3),10000);
y_ben = evalsplineben(knopen,(-3:-1)+knopen(1),knopen(end)+(1:3), t',f',10000);

plot(x,y,'b',t',f','*r', 'MarkerSize',12)
max(abs(y-yexac))

%% Vraag 13
load('opdracht13.mat')

subplot(131)
plot(gam1met,gam2met)
tit = title('gam2met tegenover gam1met');
subplot(132)
plot(rmet,gam1met)
tit = title('gam1met tegenover rmet');
subplot(133)
plot(rmet,gam2met)
tit = title('gam2met tegenover rmet');

figure
para = linspace(0,1,10000);
x = exp(2.*para.^2).*sin(5*pi.*para);
y = para.*cos(5*pi.*para);
plot(x,y)

x_interpol = evalsplineint(rmet',gam1met',(-3:-1)+rmet(1),rmet(end)+(1:3),1000);
y_interpol = evalsplineint(rmet',gam2met',(-3:-1)+rmet(1),rmet(end)+(1:3),1000);
x_ben = evalsplineben(linspace(rmet(1),rmet(end),15),(-3:-1)+rmet(1),rmet(end)+(1:3),rmet',gam1met',1000);
y_ben = evalsplineben(linspace(rmet(1),rmet(end),15),(-3:-1)+rmet(1),rmet(end)+(1:3),rmet',gam2met',1000);

figure
subplot(131)
plot(x_interpol,y_interpol)
tit = title('Exacte interpolatie van gam1met tegenover exacte interpolatie gam2met');
subplot(132)
plot(linspace(rmet(1),rmet(end),1000),x_interpol)
tit = title('Exacte interpolatie van gam1met');
subplot(133)
plot(linspace(rmet(1),rmet(end),1000),y_interpol)
tit = title('Exacte interpolatie van gam2met');

figure
subplot(131)
plot(2:98,fouten)
plot(x_ben,y_ben)
tit = title('Benaderende interpolatie van gam1met tegenover benaderende interpolatie gam2met');
subplot(132)
plot(linspace(rmet(1),rmet(end),1000),x_ben)
tit = title('Benaderende interpolatie van gam1met');
subplot(133)
plot(linspace(rmet(1),rmet(end),1000),y_ben)
tit = title('Benaderende interpolatie van gam2met');

%% Vraag 14
load('opdracht13.mat')
m = 15;

para = linspace(0,1,2001);
x = exp(2.*para.^2).*sin(5*pi.*para);
y = para.*cos(5*pi.*para);

x_ben = evalsplineben(linspace(0,1,m),[-0.6,-0.4,-0.2],[1.2, 1.4, 1.6],rmet',gam1met',2001);
y_ben = evalsplineben(linspace(0,1,m),[-0.6,-0.4,-0.2],[1.2, 1.4, 1.6],rmet',gam2met',2001);

disp(stelselsplineben(linspace(0,1,m),(-1:-3)+t(1),t(end)+(1:3),rmet',gam1met'))


mijnkwadratuurregel(abs(x_ben-x)+abs(y_ben-y))
plot(x,y,'--r',x_ben,y_ben,'b')

%% Vraag 15
load('opdracht13.mat')

para = linspace(0,1,2001);
x = exp(2.*para.^2).*sin(5*pi.*para);
y = para.*cos(5*pi.*para);
fouten = zeros(97,1);

for m = 2:98
    sx = evalsplineben(linspace(0,1,m),[-0.6,-0.4,-0.2],[1.2, 1.4, 1.6],rmet',gam1met',2001);
    sy = evalsplineben(linspace(0,1,m),[-0.6,-0.4,-0.2],[1.2, 1.4, 1.6],rmet',gam2met',2001);
    
    fouten(m-1) = mijnkwadratuurregel(abs(sx-x)+abs(sy-y));
end

optm = find(fouten == min(fouten))+1;
semilogy(2:98,fouten)

