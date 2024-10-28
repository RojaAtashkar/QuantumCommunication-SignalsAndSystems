function [P_error] = PSK4(Ns)
K=4;
delta = sqrt(Ns);
sum = 0;
W_k = exp(2*pi*1i/K);
for i=1:K
    lamda=0;
    for j=1:K
        lamda = lamda + exp(-delta^2*(1-W_k^(j-1)))*W_k^(-(i-1)*(j-1));
    end
    sum = sum + sqrt(lamda);
end
P_error = real(1-sum^2/K/K);