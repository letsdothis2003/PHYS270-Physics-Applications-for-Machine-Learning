%After using the slides and pages to 202 from the textbook, I just input
%the new formulated data, modified the code after that and added an accuracy 
%output code. 
 
load catData_w.mat;
load dogData_w.mat;
 
CD = [dog_wave cat_wave];
%The textbook(pg202) used this to represent a dog-[1,0] and cat=[0,1] matrices
%but for a different dataset and they used it to make a multi-layered neural
%net instead of lasso and linear regression

train = [dog_wave(:, 1:60) cat_wave(:, 1:60)];
test = [dog_wave(:, 61:80) cat_wave(:, 61:80)];
 
doglabel = [ones(1, size(train, 2)/2), zeros(1, size(train, 2)/2)];
catlabel = [zeros(1, size(train, 2)/2), ones(1, size(train, 2)/2)];
% Define the desired A matrix
A = [ones(1, size(train, 2)/2), zeros(1, size(train, 2)/2);
    zeros(1, size(train, 2)/2), ones(1, size(train, 2)/2)];
 
A_dog = doglabel * pinv(train);
A_cat = catlabel * pinv(train);

train_labels_dog = sign(A_dog * train);
train_labels_cat = sign(A_cat * train);
test_labels_dog = sign(A_dog * test);
test_labels_cat = sign(A_cat * test);
 
subplot(4, 1, 1), bar(test_labels_dog);
title('Test Labels for Dog');
subplot(4, 1, 2), bar(test_labels_cat);
title('Test Labels for Cat');
subplot(4, 1, 3), bar(A_dog);
title('Linear Transformation for Dog');
subplot(4, 1, 4), bar(A_cat);
title('Linear Transformation for Cat');
 
figure;
subplot(1, 2, 1);
A11 = flipud(reshape(A_dog, 32, 32));
pcolor(A11), colormap(gray);
title('Diagram of Dog data');
subplot(1, 2, 2);
A12 = flipud(reshape(A_cat, 32, 32));
pcolor(A12), colormap(gray);
title('Diagram of Catdata');

accuracy_train_dog = sum(train_labels_dog == 1) / length(train_labels_dog) * 100;
accuracy_train_cat = sum(train_labels_cat == 1) / length(train_labels_cat) * 100;
accuracy_test_dog = sum(test_labels_dog == 1) / length(test_labels_dog) * 100;
accuracy_test_cat = sum(test_labels_cat == 1) / length(test_labels_cat) * 100;
fprintf('Accuracy for train data: %.2f%%\n', (accuracy_train_dog + accuracy_train_cat) / 2);
fprintf('Accuracy for test data: %.2f%%\n', (accuracy_test_dog + accuracy_test_cat) / 2);

