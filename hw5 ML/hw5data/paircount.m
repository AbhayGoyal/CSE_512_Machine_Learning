%100*99

p2 = zeros(K,1);
[m,n] = size(centroids);
for i=1:K
    count = 0;
    for j=1:m
        if i~=centroids(j,1)
            count=count+1;
        end
    end
    p2(i,1) = count/999000;
end

p1 = zeros(K,1);
for i=1:K
    count = 0;
    for j=1:m
        if i==centroids(j,1)
            count=count+1;
        end
    end
    p1(i,1) = count/999000;
end

p3 = zeros(K,1);

for i=1:K
    p3(i,1) = (p1(K,1)+p2(K,1))/2;
end


