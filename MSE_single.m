function [result] = MSE_single(outer, n, N, d, K, avg, n0, flag)
%This function is used to calculate MSE
%outer is the number of simulations
%n is the actual budget
%N is the planned budget
%avg is the true value of the quantity of interest
%d is the nominator or delta
if flag == 3    
    [weight, g] = online_weight( n, K, n0, d );
end

mse1 = zeros(outer,1);
mse2 = zeros(outer,1);
mse3 = zeros(outer,1);


switch flag
    case 1
        for i=1:outer
            mse1(i) = Algorithm1(4, n, N, d);
        end
        result = sum(power((mse1 - avg),2))/outer;
    case 2      
        for i=1:outer
            mse2(i) = Algorithm2(4, n, d, n0);
        end
        result = sum(power((mse2 - avg),2))/outer;
    case 3
        for i=1:outer
            mse3(i) = Algorithm2_new(4, n, weight, g, n0);
        end
        result = sum(power((mse3 - avg),2))/outer;
end
end