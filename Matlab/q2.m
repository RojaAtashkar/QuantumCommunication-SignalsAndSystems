%% 
clc, clear all
% Define the range of N and Ns
N = 0:0.1:0.2;
Ns = 0.5:0.5:8;
n = 35;
h = 4;
% Pre-allocate result matrix for efficiency
result = zeros(length(N), length(Ns));
% Loop through each N value
for i = 1:length(N)
  % Loop through each Ns value
  for j = 1:length(Ns)
    % Call your function F(N(i), Ns(j)) and store the result
    result(i, j) = PPM4(n, h, N(i), Ns(j));
  end
end
%%
% Plot the results
figure;
hold on;  % To plot multiple lines on the same figure

% Loop through each N value again to plot separate lines
for i = 1:length(N)
  plot(Ns, result(i, :), 'DisplayName', sprintf('N = %.2f', N(i)));
end

% Customize the plot
xlabel('Ns');
ylabel('P_error');

title('Results of PPM4 Error for different N');
legend;
grid on;
hold off;
%%
figure;
hold on;  % To plot multiple lines on the same figure

% Loop through each N value again to plot separate lines
for i = 1:length(N)
  semilogy(Ns, result(i, :), 'DisplayName', sprintf('N = %.2f', N(i)));
  set(gca, 'YScale', 'log')
end

% Customize the plot
xlabel('Ns');
ylabel('P_error');

title('Results of PPM4 Error for different N');
legend;
grid on;
hold off;
%% Bounds
clc, clear all
% Define the range of N and Ns
N = 0:0.1:0.2;
Ns = 0.5:0.5:8;
n = 40;
h = 4;
% Pre-allocate result matrix for efficiency
result = zeros(length(N), length(Ns));
% Loop through each N value
for i = 1:length(N)
  % Loop through each Ns value
  for j = 1:length(Ns)
    % Call your function F(N(i), Ns(j)) and store the result
    result(i, j) = 1-upper_bound(4, n, h, N(i), Ns(j))
  end
end
%%
figure;
hold on;  % To plot multiple lines on the same figure

% Loop through each N value again to plot separate lines
for i = 1:length(N)
  semilogy(Ns, result(i, :), 'DisplayName', sprintf('N = %.2f', N(i)));
  set(gca, 'YScale', 'log')
end

% Customize the plot
xlabel('Ns');
ylabel('P_error');

title('Results of PPM4 Error for different N');
legend;
grid on;
hold off;