function [P_error] = QAM_SRM(n, h, Ns, N, K)
if N==0
    P_error = QAM(Ns, K);
else
L=sqrt(K);
Gamma = [];
delta = sqrt(3/2/(K-1)*Ns);
for i=1:L
    for j=1:L
       u = -(L-1) + 2*(i-1);
       v = -(L-1) + 2*(j-1);
       a = (u + 1i*v)* delta;
       rho = density_operator(n,a, N);
       [Z,D] = eig(rho);
       Z_h  = Z(:, 1:h);
       D_h = D(1:h, 1:h);
       beta = Z_h * (D_h ^(1/2));
       Gamma = [Gamma, beta];
        
    end
end
G = Gamma.' * Gamma;
X = sqrtm(G);
P_correct = 0;
for i=1:K
    P_correct = P_correct + X(i, i)*conj(X(i, i));
end
P_correct = P_correct/K;
P_error = 1-P_correct;
end