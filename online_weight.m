function [ weight, g ] = online_weight( n, K, n0, d )
q1 = 2;
q2 = 1;
% alpha = 1/6;
M = 1000; % a large number

% mid_matrix_gamma = [1/(1-2*alpha*q1), 1/(1-alpha*q1); 1/(1-alpha*q1), 1];
% inv_phai_matrix_gamma = inv([1/(1-alpha*(2*q1+q2)), 1/(1-alpha*(q1+q2)); 1/(1-alpha*(q1+q2)), 1/(1-alpha*q2)]);
% ksai_matrix_gamma = inv_phai_matrix_gamma*mid_matrix_gamma*inv_phai_matrix_gamma;
% 
% ksai11_gamma = ksai_matrix_gamma(1,1);
% ksai12_gamma = ksai_matrix_gamma(1,2);
% ksai22_gamma = ksai_matrix_gamma(2,2);


% mid_matrix = [phai(2*alpha*q1,n, n0), phai(alpha*q1,n, n0); phai(alpha*q1,n, n0), phai(0,n, n0)];
% inv_phai_matrix = inv([phai(alpha*(2*q1+q2),n, n0), phai(alpha*(q1+q2),n, n0); phai(alpha*(q1+q2),n, n0), phai(alpha*q2,n, n0)]);
% ksai_matrix = inv_phai_matrix*mid_matrix*inv_phai_matrix;

ksai_matrix = inv([phai(1,n,n0), phai((q1+2*q2)/(2*(q1+q2)),n,n0); phai((q1+2*q2)/(2*(q1+q2)),n,n0), phai(q2/(q1+q2),n,n0)]);

ksai11 = ksai_matrix(1,1);
ksai12 = ksai_matrix(1,2);
ksai22 = ksai_matrix(2,2);

delta = power(ksai12,2) + (power(K,2*(q1+q2))-ksai11)*ksai22;
second_coeff = power(K,2*(q1+q2))-ksai11;

% criteria = power((power(ksai11_gamma,2)*ksai22_gamma - power(ksai12_gamma,2)*ksai11_gamma) / power(ksai12_gamma,2), 1/(2*(q1+q2)));


fun = @(x)power(x,2)*(power(ksai11*x^2+2*ksai12*x+ksai22,2));


if delta >= 0 && second_coeff > 0    
    
    lower = (ksai12-sqrt(power(ksai12,2)+second_coeff*ksai22))/(second_coeff);
    upper = (ksai12+sqrt(power(ksai12,2)+second_coeff*ksai22))/(second_coeff);

    x1 = fminbnd(fun, -M, lower);
    x2 = fminbnd(fun, upper, M);
    if fun(x1) < fun(x2)
        a_star = x1;
    elseif fun(x1) > fun(x2)
        a_star = x2;
    else
        print('Something wrong, flag is 1');
    end
    
elseif delta >=0 && second_coeff < 0    
    
    lower = (ksai12+sqrt(power(ksai12,2)+second_coeff*ksai22))/(second_coeff);
    upper = (ksai12-sqrt(power(ksai12,2)+second_coeff*ksai22))/(second_coeff);
   
    a_star = fminbnd(fun, lower, upper);     

elseif second_coeff == 0 && ksai12 > 0

    upper = -ksai22/(2*ksai12);
    a_star = fminbnd(fun, -M, upper);

elseif second_coeff == 0 && ksai12 < 0

    lower = -ksai22/(2*ksai12);
    a_star = fminbnd(fun, lower, M);    

elseif second_coeff ==0 && ksai12 ==0 && ksai22 <=0

    a_star = 0;

elseif second_coeff ==0 && ksai12 ==0 && ksai22 > 0

    a_star = Inf;

elseif delta < 0 && second_coeff > 0

    a_star = 0;

elseif delta < 0 && second_coeff < 0

    a_star = Inf;

end

lambda1 = ksai_matrix(1,:)*[a_star; 1];
lambda2 = ksai_matrix(2,:)*[a_star; 1];

weight = zeros(n,1);
for j=1:n   
    weight(j) = lambda1/power(j+n0,(q1+2*q2)/(2*(q1+q2))) + lambda2/power(j+n0,q2/(q1+q2));
end

g = K*d;

end
