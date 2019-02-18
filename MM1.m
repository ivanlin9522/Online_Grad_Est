function [avg_system_time] = MM1(lambda_in, lambda_out)
%Simulate the MM1 queue with given arrival rate and service rate
%Interested in average system time over the first N customers
N = 10;
A = - log(rand(N,1))/lambda_in;
S = - log(rand(N,1))/lambda_out;
waitTimes = zeros(N,1);
for i=2:N
   waitTimes(i) = max(0, waitTimes(i-1) + S(i-1) - A(i)); 
end
T = waitTimes + S;
avg_system_time = sum(T)/N;