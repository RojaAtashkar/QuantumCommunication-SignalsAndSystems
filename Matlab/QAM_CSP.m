function [P_error] = QAM_CSP(n, N, Ns)
K=16;
L=sqrt(K);
rho = {};
delta = sqrt(3/2/(K-1)*Ns);
for i=1:L
    for j=1:L
       u = -(L-1) + 2*(i-1);
       v = -(L-1) + 2*(j-1);
       a = (u + 1i *v) * delta
       rho{end +1} =density_operator(n,a, N);
          
    end
end
dim = n;

cvx_begin SDP
variable X(dim, dim) hermitian
minimize(trace(X))
subject to
X> rho{1};
X> rho{2};      
X> rho{3};
X> rho{4};
X> rho{5};
X> rho{6};
X> rho{7};
X> rho{8};
X> rho{9};
X> rho{10};
X> rho{11};
X> rho{12};
X> rho{13};
X> rho{14};
X> rho{15};
X> rho{16};
cvx_end
copt=cvx_optval;
t=(copt)
t=trace(X)
P_error=1.0-t;
