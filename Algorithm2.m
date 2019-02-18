function [result] = Algorithm2(x0, n, d, n0)
% x0 is point of interest, in our case, it is arrival rate
% n is actual runs of simulation
% alpha is set to 1/6
% delta is perturbation parameter
% d = power(3,-1/6)*d0, which is d in Algorithm 1
c = 1;
alpha = 1/6;

% initialize
% n0 = 30;
delta0 = power(3,-1/6)*d/(n0+n);
theta0 = (MM1(x0+delta0,4)-MM1(x0-delta0,4))/(2*delta0);
gamma = zeros(n,1);
delta = zeros(n,1);
theta = zeros(n+1,1);
theta(1) = theta0;
for i = 1:n
    gamma(i) = c/i;
    delta(i) = power(3,-1/6)*d/((i+n0)^alpha);
    theta(i+1) = (1-gamma(i))*theta(i) + gamma(i)*(MM1(x0+delta(i),4)-MM1(x0-delta(i),4))/(2*delta(i));    
end
result = theta(n);
end

% %new scheme!
% % d = d_ * 1.445933;
% d = d_;
% alpha = 1/6;
% n0 = 10;
% W = zeros(n, 1);
% for i = 1:n
%    W(i) = W_function(i/n) - W_function((i-1)/n); 
% end

% end






