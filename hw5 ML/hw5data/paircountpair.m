%100*99
function [c1,c2,c3] = paircountpair(centroids,K)
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

c1=0;
for i=1:K
    c1 = c1+p1(K,1); 
end
c1=c1/K;

c2=0;
for i=1:K
    c2 = c2+p2(K,1); 
end
c2=c2/K;

c3=0;
for i=1:K
    c3 = c3+p3(K,1); 
end
c3=c3/K;

