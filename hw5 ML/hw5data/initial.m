

function [centroids] = initial(X, K)


centroids = zeros(K, size(X, 2));


% Take the first K examples as centroids
centroids = X(1:K, :);


end

