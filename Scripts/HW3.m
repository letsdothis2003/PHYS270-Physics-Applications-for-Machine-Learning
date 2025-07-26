% Function we are starting with and listed in the assignment
f = @(x) x^2 - 2*x + 3;

% All the parameters
initial = -2; % Initial condition
learningrate = rand(); % Generates a random number between 0 and 1
iterations = randi([10, 50]); % Generates a random integer between 10 and 50 using rand (the coding language c++ has the same exact function with the same purpose, %which surprised me)

% As assignment states, this makes the search range from -2 to 3
lower = -2; % Lower bound of the search range
upper = 3; % Upper bound of the search range

% Initializes arrays to store results for  each point 
data = zeros(iterations, 1);
fvalues = zeros(iterations, 1);

% Gradient Descent Optimization is now gonna be implemented
x = initial;
for k = 1:iterations
% Ensure that x stays within the search range
x = max(min(x, upper), lower);
% Check the gradient of the function at the current spot
gradient = 2*x - 2;
% Update x value using the formula
x = x - learningrate * gradient;
% Store the data of iterations for plotting
data(k) = x;
fvalues(k) = f(x);
end

% Plot the optimization process
figure;
% Line plot to show the convergence
subplot(2, 1, 1);
plot(1:iterations, data, '-o');
title('Convergence of x');
xlabel('Iteration');
ylabel('x');
grid on;
xlim([1 iterations]); % Set the x-axis limits to show all iterations
% Dot plots to show data
subplot(2, 1, 2);
plot(1:iterations, fvalues, 'ro-');
title('Function Values');
xlabel('Iteration');
ylabel('f(x)');
grid on;
xlim([1 iterations]); % Set the x-axis limits to show all iterations
% Display the final result
fprintf('Optimal x: %.4f\n', x);
fprintf('Optimal f(x): %.4f\n', f(x));;
