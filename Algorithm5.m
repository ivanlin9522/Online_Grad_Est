function [avg_theta] = Algorithm5(x0, n, d, n0)
avg_theta = zeros(2,1);
%x0 is 2-dimension vector, i.e., arrival rate and service rate
x1 = x0(1);
x2 = x0(2);
alpha = 1/6;
c = 1;
% n0 = 30;
delta0 = power(3,-1/6)*d/(n0+n);
theta0 = zeros(1,2);
theta0(1,:) = (MM1(x1+delta0,x2+delta0)-MM1(x1-delta0,x2-delta0))/(2*delta0);

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

theta = zeros(n+1,2);
theta(1,:) = theta0(1,:);
gamma = zeros(n,1);
delta = zeros(n,1);
for i=1:n
    gamma(i) = c/i;
    delta(i) = power(3,-1/6)*d/((i+n0)^alpha);
    theta(i+1,:) = (1-gamma(i))*theta(i,:) + gamma(i)*(MM1(x1+delta(i)*w(i,1),x2+delta(i)*w(i,2))-MM1(x1-delta(i)*w(i,1),x2-delta(i)*w(i,2)))/(2*delta(i))*T(i,:);
end
avg_theta(1) = theta(n,1);
avg_theta(2) = theta(n,2);

end


% %a new scheme
% 
% x1 = x0(1);
% x2 = x0(2);
% 
% % d = d_ * 1.445933;
% d = d_;
% alpha = 1/6;
% n0 = 10;
% % W = zeros(n, 1);
% % for i = 1:n
% %    W(i) = W_function(i/n) - W_function((i-1)/n); 
% % end
% W = optimal_weight();
% 
% w = zeros(n,2);
% for i=1:n
%     for j=1:2
%         if rand()<=0.5
%             w(i,j) = 1;
%         else
%             w(i,j) = -1;
%         end
%     end
% end
% T = power(w,-1);
% 
% theta = zeros(2,1);
% delta = zeros(n,1);
% Y = zeros(n,2);
% for i = 1:n
%     delta(i) = d / ((i+n0)^alpha);
%     Y(i,:) = (MM1(x1+delta(i)*w(i,1),x2+delta(i)*w(i,2))-MM1(x1-delta(i)*w(i,1),x2-delta(i)*w(i,2)))./(2*delta(i)).*T(i,:);   
% end
% 
% theta(1) = sum(W.*Y(:,1));
% theta(2) = sum(W.*Y(:,2));
% end







