
function [sum1] = kmrand(X, K)


%X = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/digit.txt');
%y = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/labels.txt');

centers = initialrand(X,K);
prev = centers;
%centroids = computeCenter(X, centers, K);

for i=1:20
    centroids = findCenter(X,centers);
    %t = prev~=centers;
    prev = centers;
    if xor(prev,centers)==0
        disp(i);
        break;
    end
    centers = computeCenter(X, centroids, K); 
end

%disp('i');
%disp(i);

sum1 = SS(X,K,centers,centroids);