[trainK, testK] = cmpExpX2Kernel(trainD, testD, g);

[m,n] = size(trainD);
sum=0;
chi = zeros(n,1);
for i=1:n
    sub = trainD(:,i)-testD(:,i);
    sub = sub* sub;
    add = trainD(:,i)+testD(:,i)+0.1;
    sum = sum + (sub/add);
    g1 = -(1/g);
    sum = g1*sum;
    chi(i,1) = exp(sum);
end
