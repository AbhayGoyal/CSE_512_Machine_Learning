%function [result] = multisvm(TrainingSet,GroupTrain,TestSet)
%m = csvread('Test_Features1.csv');
%disp(m);
TrainFeatures2 = importdata("Train_Features2.csv");
TrainLabels = importdata("Train_Labels.csv");
TestFeatures1 = importdata("Test_Features1.csv");
ValFeatures = importdata("Val_Features.csv");
ValL = importdata("Val_Labels.csv");
%disp(size(TrainLabels{1}));
u=unique(TrainLabels.data);
numClasses=length(u);
 TrainL = TrainLabels;
 TrainD = TrainFeatures2;
 TestD = TestFeatures1;
%build models
w=cell(numClasses,1);
for k=1:numClasses
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    %G1vAll=(TrainL.data==u(k));
    TrainL1 = double(TrainL.data);
    TrainL2 = TrainL1;
    disp('Here');
    %disp(unique(G1vAll))
   % disp(G1vAll,0)
   [x1,y1] = size(TrainD1);
    for t =1:x1
        if TrainL2(t,1)==k
            TrainL2(t,1)=k;
        end
        TrainL2(t,1)=-1;
    end
    disp(unique(G1vAll));
    [w1,b,x,y] = q2(TrainD.data',TrainL2);
    w{k} = w1;
    disp(size(w1)); 
end
%classify test cases

res1 = cell(numClasses,1);
for j=1:size(w)
    res = sign((w{j}'*TestD.data')+b);
    res= res';
    for t=1:size(res)
        if res(t)==-1
            res(t) = 0;
        res(t) = j;
        end
    end
    res1{k}=res;
end


x1 = res1(1,1);
x2 = res1(2,1);
x3 = res1(3,1);
x4 = res1(4,1);


%HW4_Utils.genRsltFile(w, bias, "train", "question_3_4_2_rects");