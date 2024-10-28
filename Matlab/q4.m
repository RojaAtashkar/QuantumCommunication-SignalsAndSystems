%%
N=0.1;
N_lamda = 5;
a=sqrt(N_lamda);
n=25;
rho = density_operator(n,a ,N);
p_e = [];
for i=15:25
p_e = [p_e, 1-trace(rho(1:i, 1:i))];
end
%%
clc, clear all;
N=0.1;
N_lamda = 5;
a=sqrt(N_lamda);
n = [20, 21, 22, 23];
h = [2, 3, 4, 5, 6];
p_v = zeros(4, 5);
for i = 1:length(n)
    rho = density_operator(n(i), a, N);
  for j = 1:length(h)
    [Z,D] = eig(rho);
    Z_h  = Z(:, 1:h(j));
    D_h = D(1:h(j), 1:h(j));
    beta = Z_h * (D_h ^(1/2));
    E = (rho - beta* beta.').^2;
    p_v(i, j) =sum(E, 'all')/n(i)/n(i)
  end
end