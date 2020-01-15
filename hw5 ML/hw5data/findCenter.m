function [clus] = findCenter(X,centroids)


K = size(centroids,1);

clus = zeros(size(X,1),1);

for i=1:length(X)
    min = 1/0;
    for j=1:K
        dist = norm(X(i,:)-X(j,:));
        if (dist<min)
            min=dist;
            clus(i) = j; 
        end
    end
end
disp(unique(clus));

    