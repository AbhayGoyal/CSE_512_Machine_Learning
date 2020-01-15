%load optim;
  
function [w, bias, alpha, obj_func] = q2(trD, trLb)

%[trD, trLb, valD, valLb, trRegs, valRegs] = HW4_Utils.getPosAndRandomNeg();
%name = fieldnames(X0);

%X0 = load("q2_1_data.mat");
x = trD;
y = trLb;

%typeinfo(y1)

%col = size(x,2);
%row = size(x,1);

%H = diag([ones(1,col) 0]);

%f = zeros(1,col+1);
%t = [X1 ones(row,1)];
%A = diag(y1)*t;
[d, n] = size(trD);

f = ones(n, 1);
disp(size(f));
f = -1 * f;
h = zeros(n, n);

for i = 1:n
    for j = 1:n
        h(i, j) = dot(x(:,i), x(:,j)) * y(i) * y(j);
    end
end
c =10;
A =[];
b =[];

disp('trD')
disp(size(trD))
disp('trLb')
disp(size(trLb))

disp(unique(trLb));
A_eq = trLb';
disp(size(A_eq));
b_eq = 0;
lb = zeros(n, 1);
ub = c * ones(n, 1);



[alpha,fval] = quadprog(h, f, A, b, A_eq, b_eq, lb, ub);


temp = y .* alpha;
w = x * temp;

temp = abs(alpha - 0.05);
[alpha_min, index] = min(temp);
bias = y(index) - (w' * x(:, index));
f1 = (w'*x)+bias;
SV = find(f1==1);
disp('SV');
disp(SV);
obj_func = -1*fval; 
