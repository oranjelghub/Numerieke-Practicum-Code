%We kiezen voor de niet equidistante punten de punten op x^2

p = (1:10).^2;
[A,b] = stelselsplineint(p,1:20,(-2:0).^3,(11:13).^3);

%spy(A, 30)
%legend('Niet nul elementen')
%xlabel('Kollom index van element van A')
%ylabel('Rij index van element van A')
%grid on
%xticks((1:12))
%yticks((1:12))

[L,U] = simple_lu(A);


spy(L, 30)
legend('Niet nul elementen')
xlabel('Kollom index van element van L')
ylabel('Rij index van element van L')
grid on
xticks((1:12))
yticks((1:12))

nexttile
spy(U, 30)
legend('Niet nul elementen')
xlabel('Kollom index van element van U')
ylabel('Rij index van element van U')
grid on
xticks((1:12))
yticks((1:12))