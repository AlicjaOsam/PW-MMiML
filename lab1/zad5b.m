%Generacja danych 
N = 500; 
X = randn(N,20); 
y = 1 + X(:,3)*5 + 3*X(:,9)+2*X(:,15) + 0.2*randn(N,1); 
plot(y) 
d=sign(y); 
d(find(y<0))=2; 
% Dane ucz�ce 
xl=X(1:N/2,:); 
dl=d(1:N/2); 
b = TreeBagger(100,xl,dl,'oobpred','on', 'oobvarimp', 'on', 'NVarToSample',4) 
qq=b.OOBPermutedVarDeltaError; bar(qq), grid 
figure, plot(oobError(b)) 
% Dane testujace  
xt=X(N/2+1:end,:);  
dt=d(N/2+1:end);  
y=predict(b,xt);  
%er=find(abs(y-dt)>0.5))  
yy=cell2mat(y);
yyy=str2num(yy);  
error=sum((yyy~=dt))/length(dt)  
nn=length(yyy);  
c1=0;
c2=0;  
for i=1:nn     
    if(yyy(i)==1 & dt(i)==1)         
        c1=c1+1;     
    else           
        if(yyy(i)==2 & dt(i)==2)         
            c2=c2+1;          
        end     
    end  
end  
d1=0;d2=0; 
for i=1:nn     
    if( dt(i)==1)         
        d1=d1+1;     
    else           
        if( dt(i)==2)              
            d2=d2+1;          
        end     
    end 
end 
% Dok�adno�� rozpoznania klas 
czul1=c1/d1*100 
czul2=c2/d2*100 