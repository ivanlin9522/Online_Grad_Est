function [ avg_theta ] = Algorithm1(x0,n, N, d)
%x0 is point of interest, in our case, it is arrival rate
%n is actual runs of simulation
%N is the budget of simulation
%alpha is set to 1/6
%delta is perturbation parameter
alpha = 1/6;
delta = d/(N^alpha);  %N cannot be too small, otherwise delta would exceed x0
theta = zeros(n,1);
for i=1:n
    theta(i) = (MM1(x0+delta,4)-MM1(x0-delta,4))/(2*delta);
end
avg_theta = mean(theta);
end
