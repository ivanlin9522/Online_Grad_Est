function [LR_estimator1, LR_estimator2] = LR_multi(lambda_in, lambda_out)
%we calculate the true value of gradient of average system time for first
%N customers with respect to arrval rate
%We use Likelihood Ratio method, which will give us an unbiased estimator
N = 10;
A = - log(rand(N,1))/lambda_in;
S = - log(rand(N,1))/lambda_out;
waitTimes = zeros(N,1);
for i=2:N
   waitTimes(i) = max(0, waitTimes(i-1) + S(i-1) - A(i)); 
end
T = waitTimes + S;
LR_estimator1 = sum(T*sum(1/lambda_in - A))/N;
LR_estimator2 = sum(T*sum(1/lambda_out - S))/N;
end

