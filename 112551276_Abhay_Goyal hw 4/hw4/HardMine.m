run('C:\Users\Administrator\Downloads\hw4\vlfeat-0.9.21-bin\vlfeat-0.9.21\toolbox/vl_setup.m');

load("trainAnno.mat")

c = 10;
[trD, trLb, valD, valLb, trRegs, valRegs] = HW4_Utils.getPosAndRandomNeg();
[w, bias, alpha, objective_function] = q2(trD, trLb);

[row,col] = size(trD);
PosD = [];
NegD = [];
eps = 0.1;


%disp(size(trD,2));
for i = 1:size(trD, 2)
    if(trLb==1)
        PosD = [PosD, trD(:,1)];
    else
        if alpha(i)<eps
            NegD = [NegD, trD(:,1)];
        end
    end
end

HW4_Utils.genRsltFile(w, bias, "train", "question_3_4_2_rects");

objective_function_vals = [];
ap_array = [];

for iter = 1:10
    disp("iteration : ");
    disp(iter);
    PosD = [];
    NegD = [];
    for i = 1:size(trLb, 1)
       if trLb(i) == 1
           PosD = [PosD, trD(:, i)];
       else
           if alpha(i) < eps
               NegD = [NegD, trD(:, i)];
           end
       end
    end
    HW4_Utils.genRsltFile(w, bias, "train", "question_3_4_2_rects");
    
    load("question_3_4_2_rects.mat");
    hard_neg = [];
    disp(size(rects))
    for i  = 1:length(rects)
       im = imread(sprintf('%s/%sIms/%04d.jpg', HW4_Utils.dataDir, "train", i));
       [iH, iW, ~] = size(im);
       disp(size(rects))
       cur_rect = rects{i};
       badin  = or(cur_rect(3,:) > iW, cur_rect(4,:) > iH);
       cur_rect = cur_rect(:,~badin);
       ubs = ubAnno{i};
       overlap =[];
       for j  = 1:size(ubs,2)
          rect_over = HW4_Utils.rectOverlap(cur_rect, ubs(:,j)); 
          overlap = [overlap,rect_over];
       end
        for j=1:length(cur_rect)
            if cur_rect(5,j)>0
                continue
             end
            flag=0;
            for k = 1:size(ubs,2)
                if(overlap(j,k)>0.3)
                    flag=1;
                    break;
                end
            end
            if flag==0  
                imReg = im(int16(cur_rect(2, j)):int16(cur_rect(4, j)),int16(cur_rect(1, j)):int16(cur_rect(3, j)), :);
                imReg = imresize(imReg, HW4_Utils.normImSz);
                
                %feat = HW4_Utils.cmpFeat(rgb2gray(imReg));
                feat = HW4_Utils.cmpFeat((imReg));
                feat = feat / norm(feat);
                hard_neg = [hard_neg, feat];
                
                if size(hard_neg, 2) > 1000
                    break;
                end
           end
            if size(hard_neg, 2) > 1000
                break;
            end
        end
        if size(hard_neg, 2) > 1000
            break;
        end
    end
    NegD = [NegD, hard_neg];
    temp_neg_labels = -1 * ones(size(NegD, 2), 1);
    trD = [];
    trD = [trD, PosD];
    trLb = ones(size(trD, 2), 1);
    trD = [trD, NegD];
    trLb = [trLb; temp_neg_labels];
    
    %disp(size(trD));
    %disp(size(trLb));
    [w, bias, alpha, objective_function] = q2(trD, trLb);
   
    objective_function_vals = [objective_function_vals, objective_function];
    
    HW4_Utils.genRsltFile(w, bias, "val", "question_3_4_2_val_outputs");

    [ap, prec, rec] = HW4_Utils.cmpAP("question_3_4_2_val_outputs", "val");
    ap_array = [ap_array, ap];
end

numbers = linspace(1, 10, 10);
subplot(2,1,1);
plot(numbers, objective_function_vals);
subplot(2,1, 2);
plot(numbers, ap_array);

HW4_Utils.genRsltFile(w, bias, "test", "submission_output_test");
            
