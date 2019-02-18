% single

LR = zeros(1000000,1);
for i=1:1000000
   LR(i) = LR_single(4,4); 
end
avg = sum(LR)/1000000;

outer = 1000;
N = [10000, 20000, 30000, 50000, 80000, 100000];
n = [10000, 20000, 30000, 50000, 80000, 100000];
n0 = [500,500,500,500,500,500];

K = [1,2,3,4];
d = 3;
result1 = zeros(6,1);
result2 = zeros(6,1);
result3 = zeros(6,4);

for i=1:6
    result1(i) = MSE_single(outer, n(i), N(i), d, 1, avg, n0(i), 1);
    result2(i) = MSE_single(outer, n(i), N(i), d, 1, avg, n0(i), 2);
    
    result3(i,1) = MSE_single(outer, n(i), N(i), d, K(1), avg, n0(i), 3);
    result3(i,2) = MSE_single(outer, n(i), N(i), d, K(2), avg, n0(i), 3);
    result3(i,3) = MSE_single(outer, n(i), N(i), d, K(3), avg, n0(i), 3);
    result3(i,4) = MSE_single(outer, n(i), N(i), d, K(4), avg, n0(i), 3);
end

% result1 = zeros(6,3);
% for i = 1:6
%     [result1(i,1), result1(i,2), result1(i,3)] = MSE_single(outer, n(i), N(i), 2, 1, avg, n0(i));
% end
% 
% result2 = zeros(6,3);
% 
% for i = 1:6
%     [result2(i,1), result2(i,2), result2(i,3)] = MSE_single(outer, n(i), N(i), 2, 2, avg, n0(i));
% end
% 
% result3 = zeros(6,3);
% 
% for i = 1:6
%     [result3(i,1), result3(i,2), result3(i,3)] = MSE_single(outer, n(i), N(i), 2, 5, avg, n0(i));
% end
% 
% result4 = zeros(6,3);
% 
% for i = 1:6
%     [result4(i,1), result4(i,2), result4(i,3)] = MSE_single(outer, n(i), N(i), 2, 6, avg, n0(i));
% end

% result5 = zeros(6,3);
% 
% for i = 1:6
%     [result5(i,1), result5(i,2), result5(i,3)] = MSE_single(outer, n(i), N(i), 4, 2.5, avg, n0(i));
% end



% % multi
% 
% outer = 1000;
% 
% avg = zeros(outer,2);
% LR = zeros(1000000,2);
% for i=1:1000000
%    [LR(i,1),LR(i,2)] = LR_multi(4,4); 
% end
% avg(1,:) = sum(LR,1)/1000000;
% for i=2:outer
%     avg(i,:) = avg(1,:);
% end
% 
% N = [10000, 20000, 30000, 50000, 80000, 100000];
% n = [10000, 20000, 30000, 50000, 80000, 100000];
% n0 = [200,200,200,200,200,200];
% 
% result11 = zeros(6,3);
% for i=1:6
%     [result11(i,1), result11(i,2), result11(i,3)] = MSE_multi(outer, avg, n(i), N(i), 2, 1, n0(i));
% end
% 
% result22 = zeros(6,3);
% for i=1:6
%     [result22(i,1), result22(i,2), result22(i,3)] = MSE_multi(outer, avg, n(i), N(i), 2, 1.5, n0(i));
% end
% 
% 
% result33 = zeros(6,3);
% for i=1:6
%     [result33(i,1), result33(i,2), result33(i,3)] = MSE_multi(outer, avg, n(i), N(i), 2, 2, n0(i));
% end
% 
% 
% result44 = zeros(6,3);
% for i=1:6
%     [result44(i,1), result44(i,2), result44(i,3)] = MSE_multi(outer, avg, n(i), N(i), 2, 2.5, n0(i));
% end










