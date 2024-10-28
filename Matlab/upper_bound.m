function [bound] = upper_bound(K, n, h, N, Ns)
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
rho_0 = B_0 * B_0.';
rho_1 = B_1 * B_1.';
rho_2 = B_2 * B_2.';
rho_3 = B_3 * B_3.';

rho = {rho_0, rho_1, rho_2, rho_3};
F = {};
F{end+1} = rho{2} - rho{1};
S = PositiveMatrix(F{1});
for i=1:K-2
    F{end + 1} = rho{i+2} - rho{1} - S;
    S = S + PositiveMatrix(F{end});
end
bound = trace(rho{1} + S);
