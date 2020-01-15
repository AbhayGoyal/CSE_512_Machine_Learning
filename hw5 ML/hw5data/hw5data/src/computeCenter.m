function [cent] = computeCenter(X,index,K)

[m,n] = size(X);

cent = zeros(K,n);
disp(size(index));
for i=1:K
    id = index;
    for j=1:n
        cent(i,j) = sum(X(:,j).*id)/sum(id);
    end
    
end
