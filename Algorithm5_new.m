function [ theta ] = Algorithm5_new( x0, n, weight, g, n0 )


x1 = x0(1);
x2 = x0(2);

alpha = 1/6;
% n0 = 30;


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

theta = zeros(2,1);
delta = zeros(n,1);
Y = zeros(n,2);
for i = 1:n
    delta(i) = g / ((i+n0)^alpha);
    Y(i,:) = (MM1(x1+delta(i)*w(i,1),x2+delta(i)*w(i,2))-MM1(x1-delta(i)*w(i,1),x2-delta(i)*w(i,2)))./(2*delta(i)).*T(i,:);   
end

theta(1) = sum(weight.*Y(:,1));
theta(2) = sum(weight.*Y(:,2));
end


