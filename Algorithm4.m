function [avg_theta] = Algorithm4(x0, n, N, d)
avg_theta = zeros(2,1);
%x0 is 2-dimension vector, i.e., arrival rate and service rate
x1 = x0(1);
x2 = x0(2);
alpha = 1/6;
% n0 = 30;
delta = d/((N)^alpha);

w = zeros(n,2);
for i=1:n
    for j=1:2
        if rand()<=0.5
            w(i,j) = 1;
        else
            w(i,j) = -1;
        end
    end
end
T = power(w,-1);

theta = zeros(n,2);
for i=1:n
    theta(i,:) = (MM1(x1+delta*w(i,1),x2+delta*w(i,2))-MM1(x1-delta*w(i,1),x2-delta*w(i,2)))./(2*delta).*T(i,:);
end
avg_theta(1) = sum(theta(:,1))/n;
avg_theta(2) = sum(theta(:,2))/n;
end

