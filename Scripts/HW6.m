% Load the iris dataset
load fisheriris.mat

% Extract the features from the dataset
X = meas;

% cluster the data points in 3 groups using kmeans function
numClusters = 3;
[index, C] = kmeans(X, numClusters);

%disregard the labels ( species’)
cluster = categorical(index);

% Now load the actual species labels
species = categorical(species);

% Create a confusion matrix with labels
matrixWithLabels = confusionmat(species, cluster);

%Compare the results with the existing labels(‘species’).
disp('with Labels:');
disp(matrixWithLabels);

%without labels
disp('Without Labels:');
disp(index);

%The difference should be that the one with labels is organized into a
%matrix while the one without it is just a literally a cluster for each data
%point.







