function [R] = density_operator(n, a , N)
% Pre-allocate the matrix with zeros
R = zeros(n, n);
if a==0
    for j=1:n
        R(j, j) = N^(j-1)/((N+1)^j);
    end
else

% Fill the matrix using the provided function f(m, n)
for i = 1:n
  for j = 1:n
    R(i, j) = N^(j-1)/((N+1)^j) * sqrt(factorial(i-1)/factorial(j-1)) * (conj(a)/N)^(j-i)  * exp(-(abs(a))^2/(N+1)) *laguerreL(i-1, j-i, (-(abs(a))^2/N/(N+1)) );
  end
end

end

end
