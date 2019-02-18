function [result] = MSE_multi(outer, avg, n, N, d, K, n0, flag)
%This function is used to calculate MSE
%outer is the number of simulations
%n is the actual budget
%N is the planned budget
%avg is the true value of the quantity of interest
%d is the nominator of delta

if flag == 3    
    [weight, g] = online_weight( n, K, n0, d );
end

mse4 = zeros(outer,2);
mse5 = zeros(outer,2);
mse6 = zeros(outer,2);

switch flag
    case 1
        for i=1:outer
            mse4(i,:) = Algorithm4([4,4], n, N, d);
        end
        result = power(norm(mse4 - avg),2)/outer;
    case 2      
        for i=1:outer
            mse5(i,:) = Algorithm5([4,4], n, d, n0);
        end
        result = power(norm(mse5 - avg),2)/outer;
    case 3
        for i=1:outer
            mse6(i,:) = Algorithm5_new([4,4], n, weight, g, n0);
        end
        result = power(norm(mse6 - avg),2)/outer;
end
end
