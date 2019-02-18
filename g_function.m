function [ g ] = g_function( n, weight, d, n0 )
alpha = 1/6;
q1 = 2;
q2 = 1;
% n0 = 30;
temp1 = zeros(n,1);
temp2 = zeros(n,1);
for j=1:n
   temp1(j) = power(j+n0,2*alpha*q2)*power(weight(j),2);
   temp2(j) = weight(j)/power(j+n0,alpha*q1); 
end

temp3 = sum(temp1);
temp4 = power(sum(temp2),2);

eta = power(temp3/temp4, 1/(2*(q1+q2)));
g = eta*d;

end

