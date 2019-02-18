function [ theta ] = Algorithm2_new( x0, n, weight, g, n0)

%x0 = 4;
% n0 = 30;
alpha = 1/6;
delta = zeros(n,1);
Y = zeros(n,1);
for j = 1:n
    delta(j) = g / ((j+n0)^alpha);
    Y(j) = (MM1(x0+delta(j),4)-MM1(x0-delta(j),4))/(2*delta(j));    
end

theta = sum(weight.*Y);
end

