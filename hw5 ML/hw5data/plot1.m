
X = load('C:\Users\Administrator\Downloads\hw5data/hw5data/digit/digit.txt');

f = cell(10,1);

for j=1:10
    sum=0;
    for i=1:10
        t = kmrand(X,i);
        sum=sum+t;
    end
    sum=sum/10;
    f{j,1} = sum;
    disp(sum);
end

%{
for i=1:10
    t = kmrand(X,i);
    f{i,1}=t;
end
%}