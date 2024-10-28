function [P_error] = PPM4(n, h, N , Ns)
K = 4;
if N==0
    X = exp(-Ns);
    P_error= 1-1/(K^2)*(sqrt(1 + (K-1)*X) + (K-1)* sqrt(1-X))^2;
else
delta = sqrt(Ns);
rho_delta = density_operator(n, delta, N);
rho_zero = density_operator(n, 0, N);
[Z1,D1] = eig(rho_delta);
Z_h1  = Z1(:, 1:h);
D_h1 = D1(1:h, 1:h);
beta_1 = Z_h1 * (D_h1 ^(1/2));

Z0= eye(n);
Z_h0  = Z0(:, 1:h);
D_h0 = rho_zero(1:h, 1:h);
beta_0 = Z_h0 * (D_h0 ^(1/2));

B_0=kron(beta_0, kron(beta_0, kron(beta_0, beta_1)));
B_1=kron(beta_0, kron(beta_0, kron(beta_1, beta_0)));
B_2=kron(beta_0, kron(beta_1, kron(beta_0, beta_0)));
B_3 =kron(beta_1, kron(beta_0, kron(beta_0, beta_0)));


W_k = exp(2* pi* 1i/K);
sum = zeros(h^K, h^K);
for i = 1:K
    D = B_0' * B_0  + B_0.'* B_1 * W_k^(-(i-1)) + B_0.' * B_2 * W_k^(-2*(i-1)) + B_0.' * B_3*W_k^(-3*(i-1));
    sum = sum + D^(1/2);
end

P_correct = real(trace(sum^2)/(K*K));
P_error = 1-P_correct;


end
end