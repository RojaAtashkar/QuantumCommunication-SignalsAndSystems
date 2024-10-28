function [P_error] = OOK(n, Ns, N)
if N==0
    P_error= 1/2 * (1-sqrt(1-exp(-2*Ns)));
else
a =sqrt(2*Ns);
Des = 1/2 * (density_operator(n,a, N) - density_operator(n, 0, N));
[V, D] = eig(Des);
sum=0;
for i=1:n
    if D(i, i)>0
        sum = sum + D(i, i);
    end
end
P_error = 1/2 -sum;
end