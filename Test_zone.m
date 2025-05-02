%Knal hier code dat je wilt uittesten


p = (0:20).*10;
[A,b] = stelselsplineben(p,(-3:-1),(201:203),(1:15).*3,((1:15).*3).^2);

disp(zeros(3,7))