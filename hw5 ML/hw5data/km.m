

X = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/digit.txt');
y = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/labels.txt');

K=6;
centers = initial(X,K);
prev = centers;
%centroids = computeCenter(X, centers, K);

for i=1:20
    centroids = findCenter(X,centers);
    %t = prev~=centers;
    centers = computeCenter(X, centroids, K); 
    prev = centers;
    if xor(prev,centers)==0
        disp(i);
        break;
    end
end

disp('i');
disp(i);