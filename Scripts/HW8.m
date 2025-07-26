%Code went over from recent class lecture(lines 5 to 10)
load('mnist.mat');
load('mnist_reduced.mat');
MnistReducedX = trainX(1:1000, :);
MnistReducedY = trainY(1:1000);
imshow(reshape(MnistReducedX(21, :), 28, 28));

% This creates a data table with values from both matfiles for the
% classificaton learner to run through
data = table;
for i = 1:1000
dataRow = array2table(MnistReducedX(i, :));
dataRow.Label = MnistReducedY(i);
if i == 1
data = dataRow;
else
data = [data; dataRow];
end
end
% Save the table to a file(I know it's probably wrong for it to produce
% another mat data file but I can't find a way for the Class Learner app to
% use the 2 data files provided)
save('mnist_reduced_table.mat', 'data');
