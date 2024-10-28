function [P_error] = QAM(Ns, K)
L=sqrt(K);
G= zeros(K, K);
delta = sqrt(3/2/(K-1)*Ns);
row_count= 1;
col_count= 1;
for i=1:L
    for j=1:L
       u = -(L-1) + 2*(i-1);
       v = -(L-1) + 2*(j-1);
        for k=1:L
            for p=1:L
                 u_prime = -(L-1) + 2*(k-1);
                 v_prime = -(L-1) + 2*(p-1);
                 alpha = u + 1i*v;
                 beta = u_prime + 1i*v_prime;
                 G(row_count, col_count) = exp(-delta^2 *(abs(alpha)^2 + abs(beta)^2 - 2*conj(alpha)*beta));
                 col_count = col_count+1;
            end
        end
        col_count = 1;
        row_count = row_count +1;
    end
end

X = sqrtm(G);
P_correct = 0;
for i=1:K
    P_correct = P_correct + X(i, i)*conj(X(i, i));
end
P_correct = P_correct/K;
P_error = 1-P_correct;