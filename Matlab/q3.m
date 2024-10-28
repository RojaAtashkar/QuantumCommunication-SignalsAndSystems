K = 4;
Nr =0:0.1:10;
P_error_QAM = [];
P_error_PSK = [];
P_error_PPM = [];
for i = 1:length(Nr)
    Ns = Nr*log2(K);
    P_error_QAM =[P_error_QAM, QAM(Ns(i), 4)];
    P_error_PSK = [P_error_PSK, PSK4(Ns(i))];
    P_error_PPM = [P_error_PPM, PPM4(0, 0, 0, Ns(i))];
end

%%
% Plot the results
figure;
hold on;  % To plot multiple lines on the same figure

% Loop through each N value again to plot separate lines

plot(Nr,P_error_QAM, 'DisplayName', 'QAM4');
plot(Nr,P_error_PSK, 'DisplayName', 'PSK4');
plot(Nr,P_error_PPM, 'DisplayName', 'PPM');

% Customize the plot
xlabel('NR');
ylabel('P_error');

title('Results of PPM4,QAM4, PPM4');
legend;
grid on;
hold off;
%%
figure;
hold on;  % To plot multiple lines on the same figure

% Loop through each N value again to plot separate lines

semilogy(Nr,P_error_QAM, 'DisplayName', 'QAM4');
semilogy(Nr,P_error_PSK, 'DisplayName', 'PSK4');
semilogy(Nr,P_error_PPM, 'DisplayName', 'PPM4');
set(gca, 'YScale', 'log')
% Customize the plot
xlabel('NR');
ylabel('P_error');

title('Results of PPM4,QAM4, PPM4');
legend;
grid on;
hold off;