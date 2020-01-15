
function [sum1] = SS(X,K,centers,centroids)


p = cell(K,1);

for i=1:K
    Xr = centers(i,:);
    sum=0;
    count=0;
    for j=1:1000
        %disp(centorids(j,1));
        if centroids(j,1)==i
            count=count+1;
            %e = sqrt(sum((X(j,:) - Xr) .^ 2));
            e = norm(X(j,:)-Xr);
            e = e*e;
            sum = sum+e;
        end
    end
    p{i,1} = sum/count;
    %disp(p{i,1});
end

sum1 = 0;
for i=1:size(p)
    sum1 = sum1+p{i,1};
end

%disp(sum1);


%cent(i,j) = sum(X(:,j).*id)/sum(id);
