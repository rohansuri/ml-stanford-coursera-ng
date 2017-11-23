%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b;alpha = 0.01;', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');


% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.

price = [1 unseenNormalize([1650 3], mu, sigma)] * theta; % You should change this


fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf("\nAlpha = %f  Iterations = %d \n", alpha, num_iters);
fprintf('Initial value of J \n');
fprintf(' %f \n', J_history(1,1));
fprintf('Final value of J \n');
fprintf(' %f \n', J_history(numel(J_history)));
% ============================================================

% Varying alpha
alpha = 0.03;
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
hold on;
plot(1:numel(J_history), J_history, '-g;alpha = 0.03;', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf("\nAlpha = %f  Iterations = %d \n", alpha, num_iters);
fprintf('Initial value of J \n');
fprintf(' %f \n', J_history(1,1));
fprintf('Final value of J \n');
fprintf(' %f \n', J_history(numel(J_history)));


% ============================================================

% Varying alpha
alpha = 0.001;
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
hold on;
plot(1:numel(J_history), J_history, '-r;alpha = 0.001;', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf("\nAlpha = %f  Iterations = %d \n", alpha, num_iters);
fprintf('Initial value of J \n');
fprintf(' %f \n', J_history(1,1));
fprintf('Final value of J \n');
fprintf(' %f \n', J_history(numel(J_history)));


% ============================================================


% Varying alpha
alpha = 0.1;
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
hold on;
plot(1:numel(J_history), J_history, '-m;alpha = 0.1;', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf("\nAlpha = %f  Iterations = %d \n", alpha, num_iters);
fprintf('Initial value of J \n');
fprintf(' %f \n', J_history(1,1));
fprintf('Final value of J \n');
fprintf(' %f \n', J_history(numel(J_history)));

% ============================================================



% Varying alpha
alpha = 1.312;
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
hold on;
plot(1:numel(J_history), J_history, '-c;alpha = 1.312;', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf("\nAlpha = %f  Iterations = %d \n", alpha, num_iters);
fprintf('Initial value of J \n');
fprintf(' %f \n', J_history(1,1));
fprintf('Final value of J \n');
fprintf(' %f \n', J_history(numel(J_history)));


% ============================================================

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');

J = computeCostMulti(X, y, theta);
fprintf('Cost function J :\n');
fprintf(' %f \n', J);
fprintf('\n');

hold on;
plot(0, J, 'rx;normalEqn;', 'markersize', 20, 'LineWidth', 2);

%plot(1:num_iters, J * ones(num_iters), '-k',  'LineWidth', 2);

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = [1 1650 3] * theta; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

