
% Load the image, in this case it's the Einstein one(I put the jpg in my %directory so it's in my workspace)
einstein = imread('einstein.jpg');

% (a) Find the rank of this matrix.
rank_einstein = rank(double(einstein));
disp(['Rank of the matrix: ', num2str(rank_einstein)]);

% Perform singular value decomposition or SVD
[U, S, V] = svd(double(einstein));

% Calculate singular values
sv = diag(S);

% (b) Calculate the singular values and plot them in a descending order figure
plot(sv, 'bo-');
title('Singular Values');
xlabel('Singular Value Index');
ylabel('Singular Value Magnitude');

%(c)Using singular value decomposition approximate this matrix for the 1st,
%10th, 20th, 30th, 40th, 50th, and 500th order and reproduce the associated
%image.
orders = [1, 10, 20, 30, 40, 50, 500];

figure;
for i = 1:length(orders)
order = orders(i);


reconstructed_einstein = U(:, 1:order) * S(1:order, 1:order) * V(:, 1:order)';


% Display the reconstructed image 
subplot(2, 4, i);
imshow(uint8(reconstructed_einstein));
title(['Order ', num2str(order)]);
end

% Initialize an array to store the norm of error for each approximation
errors = zeros(1, length(orders));

%(d) Calculate the norm of errors
for i = 1:length(orders)
order = orders(i);

% Calculate the difference between the original image and the reconstructed image
error_matrix = double(einstein) - U(:, 1:order) * S(1:order, 1:order) * V(:, 1:order)';

% Calculate the norm of the error matrix
errors(i) = norm(error_matrix, 'fro');
end

% Display the norm of error for each approximation
disp('Norm of Errors(For each 7 terms respectively):');
disp(errors);
