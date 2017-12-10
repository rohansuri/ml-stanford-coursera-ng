function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


% Hidden layer
%{
a1 = [ones(size(X, 1) , 1), X];
z2 = Theta1 * a1';
a2 = sigmoid(z2)';

% Output layer
a2 = [ones(size(a2, 1), 1), a2];
z3 = Theta2 * a2';
a3 = sigmoid(z3)';
%}

% nargin - returns no of parameters given to function

% TODO: Find a way to get parameters of function to fill this cell array
theta = { Theta1, Theta2 };  % cell arrays
ai_1 = X; % a1
for i = 2:nargin % no of layers
  ai_1 = [ones(m,1) ai_1]; % bias unit
  zi = theta{1, i-1} * ai_1'; 
  ai = sigmoid(zi)'; 
  ai_1 = ai; % for the next i
endfor

[mx, p] = max(ai, [], 2);






% =========================================================================


end
