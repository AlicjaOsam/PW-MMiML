load cigar.mat 
nn=randperm(2200); 
xperm=x(nn,:); 
dperm=d(nn); 
Xucz=xperm(1:1000,:); 
Xtest=xperm(1001:2200,:); 
Tucz=dperm(1:1000); 
Ttest=dperm(1001:2200); 
model = fitcnb(Xucz,Tucz) 
yucz = model.predict(Xucz); 
% Confusion matrix 
C_ucz = confusionmat(Tucz,yucz) 
ytest = model.predict(Xtest); 
acc_ucz1=sum(diag(C_ucz))/sum(sum(C_ucz)) 
% Confusion matrix 
C_test = confusionmat(Ttest,ytest) 

model = fitcnb(Xucz,Tucz, 'OptimizeHyperparameters','auto');  
yucz = model.predict(Xucz); 
% Confusion matrix 
C_ucz = confusionmat(Tucz,yucz) 
ytest = model.predict(Xtest); 

% Confusion matrix 
C_test = confusionmat(Ttest,ytest) 