
X0 = load("q2_1_data.mat");
trD = getfield(X0,"trD");
trLb = getfield(X0,"trLb");
val1 = getfield(X0,"valD");
val1 = val1';
val2 = getfield(X0,"valLb");

disp('trD')
disp(size(trD))
disp('trLb')
disp(size(trLb))

[w, bias, z, obj_func] = q2(trD, trLb)


res = sign((w'*val1')+bias);

[C,order] = confusionmat(res,val2);
confusionchart(C);

tp  = C(1,1);
tn = C(2,2);
disp((tp+tn)/(C(1,1)+C(1,2)+C(2,1)+C(2,2)));

