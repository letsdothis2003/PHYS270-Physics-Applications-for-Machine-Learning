% Load the iris data
load fisheriris.mat

% Extract the features from the dataset
X = meas;

% cluster the data points in 3  groups using "clusterdata" function,
% replacing k-means from hw6
numClusters = 3;
result = clusterdata(X, 'maxclust', numClusters);

% Disregard the labels ('species')
cluster = categorical(result);

% Now load the actual species labels
species = categorical(species);

% Create a confusion matrix with labels
matrixWithLabels = confusionmat(species, cluster);

% Compare the results with the existing labels ('species')
disp('Confusion Matrix with Labels:');
disp(matrixWithLabels);
disp('Cluster Assignments Without Labels:');
disp(result);

% Create a dendrogram
dendrogram(linkage(X, 'ward'));


