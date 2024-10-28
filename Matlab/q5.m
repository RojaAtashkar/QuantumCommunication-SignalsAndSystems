%% a 
clc, clear all
% Define the range of N and Ns
N = [0, 0.05, 0.1, 0.2];
Ns = 0:0.5:8;
n = 40;
% Pre-allocate result matrix for efficiency
result = zeros(length(N), length(Ns));
% Loop through each N value
for i = 1:length(N)
  % Loop through each Ns value
  for j = 1:length(Ns)
    % Call your function F(N(i), Ns(j)) and store the result
    result(i, j) = OOK(n, Ns(j), N(i));
  end
end
%% a plot
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

title('Results of OOK Error');
legend;
grid on;
hold off;
%% b SRM
clc, clear all
% Define the range of N and Ns
N = [0, 0.1, 0.2];
Ns = 0.5:1:8;
n = 40;
h = 8;
% Pre-allocate result matrix for efficiency
result = zeros(length(N), length(Ns));
% Loop through each N value
for i = 1:length(N)
  % Loop through each Ns value
  for j = 1:length(Ns)
      
    % Call your function F(N(i), Ns(j)) and store the result
    result(i, j) = QAM_SRM(n, h, Ns(j),N(i), 16)
  end
end
%% b plot SRM
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

title('Results of OOK Error');
legend;
grid on;
hold off;