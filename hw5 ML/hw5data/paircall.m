
X = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/digit.txt');
y = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/labels.txt');
p1 = zeros(10,1);
p2 = zeros(10,1);
p3 = zeros(10,1);
for i=1:10
    [c1,c2,c3] = kmpair(X,i);
    p1(i,1) = c1;
    p2(i,1) = c2;
    p3(i,1) = c3;
end