function [ result ] = phai( kai, n, n0 )
small_part = zeros(n,1);
for j=1:n
    small_part(j) = 1/power(j+n0,kai);
result = sum(small_part);
end

