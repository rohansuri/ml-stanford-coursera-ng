function [h, display_array] = displayData(X, example_width)
%DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in a nice grid. It returns the figure handle h and the 
%   displayed array if requested.

% Set example_width automatically if not passed in
if ~exist('example_width', 'var') || isempty(example_width) 
	example_width = round(sqrt(size(X, 2)));
end

% Gray Image
% colormap values must be between 0 and 1
colormap(gray);

% Compute rows, cols
[m n] = size(X);
example_height = (n / example_width);

% Compute number of items to display
% We want to display the training data in a grid way
% Where each grid is an image
% Each image here is 20x20 and we have m such images
% To show them in a grid, we compute the no of rows,cols we'd need for the grid
display_rows = floor(sqrt(m));
display_cols = ceil(m / display_rows);

% Between images padding
pad = 1;

% Setup blank display
display_array = - ones(pad + display_rows * (example_height + pad), ...
                       pad + display_cols * (example_width + pad));

% Copy each example into a patch on the display array
curr_ex = 1;
for i = 1:display_rows
	for j = 1:display_cols
		if curr_ex > m, 
			break; 
		end
		% Copy the patch
		
		% Get the max value of the patch
		max_val = max(abs(X(curr_ex, :)));
		display_array(pad + (i - 1) * (example_height + pad) + (1:example_height), ...
		              pad + (j - 1) * (example_width + pad) + (1:example_width)) = ...
						reshape(X(curr_ex, :), example_height, example_width) / max_val;
    % Why divide by max?        
    % To ensure all values are <=1, because colormap needs them to be
		curr_ex = curr_ex + 1;
	end
	if curr_ex > m, 
		break; 
	end
end

% Display Image
% [-1 1] are caxis limits
% 2-element vector specifying the
% lower and upper limits to assign to the first and last value in the colormap
h = imagesc(display_array, [-1 1]);

% Do not show axis
axis image off

drawnow;

end
