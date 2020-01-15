

function [centroids] = initialrand(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

centroids = zeros(K, size(X, 2));


%randidx = randperm(size(X, 1));
% Take the first K examples as centroids
index = randsample(1:length(X), K);
%disp(index);
centroids = X(index,:);


%centroids = X(1:K, :);


end

