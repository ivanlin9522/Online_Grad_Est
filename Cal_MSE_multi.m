%This script is used to calculate MSE for multi-dimensional case
% multi

outer = 1000;

avg = zeros(outer,2);
LR = zeros(1000000,2);
for i=1:1000000
   [LR(i,1),LR(i,2)] = LR_multi(4,4); 
end
avg(1,:) = sum(LR,1)/1000000;
for i=2:outer
    avg(i,:) = avg(1,:);
end

N = [10000, 20000, 30000, 50000, 80000, 100000];
n = [10000, 20000, 30000, 50000, 80000, 100000];
n0 = [500,500,500,500,500,500];

K = [1,2];
d = 3;

result1 = zeros(6,1);
result2 = zeros(6,1);
result3 = zeros(6,2);

for i=1:6
    result1(i) = MSE_multi(outer, avg, n(i), N(i), d, 1, n0(i), 1);
    result2(i) = MSE_multi(outer, avg, n(i), N(i), d, 1, n0(i), 2);
    
    result3(i,1) = MSE_multi(outer, avg, n(i), N(i), d, K(1), n0(i), 3);
    result3(i,2) = MSE_multi(outer, avg, n(i), N(i), d, K(2), n0(i), 3);
%     result3(i,2) = MSE_multi(outer, avg, n(i), N(i), d, K(2), n0(i), 3);
%     result3(i,3) = MSE_multi(outer, avg, n(i), N(i), d, K(3), n0(i), 3);
%     result3(i,4) = MSE_multi(outer, avg, n(i), N(i), d, K(4), n0(i), 3);
    
end
