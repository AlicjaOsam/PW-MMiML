clear all
%load('muzyka_1.mat');
[y,fs]=audioread('handel.wav');
s=y(1:73088);
%soundsc(s,fs)
%pause
%X= reshape(s,64,2000); % podzia na ramki
X= reshape(s,64,1142); % podzia na ramki
Rxx=X*X'/length(X(1,:)); % macierz korelacji
[v,d]=eig(Rxx); %dekompozycja wg wartoci wasnych
v=fliplr(v); % ustawienie wektorw wasnych wg wartoci wasnych malejcych
d=flipud(fliplr(d)); % ustawienie wartoci wasnych malejco
K=16; % liczba uwzgldnionych skadnikw gwnych
Rxx_hat=zeros(64,64);
for i=1:K
Rxx_hat=Rxx_hat+d(i,i)*v(:,i)*v(:,i)'; % odtworzenie macierzy korelacji
end
Error_Rxx=norm(Rxx-Rxx_hat); % bd rekonstrukcji macierzy korelacji
W=[v(:,1:K)]'; % macierz przeksztacenia PCA
Y=W*X; % transformacja PCA x->y
X_hat=W'*Y; % odtworzenie wektorw x
Error_X=norm(X-X_hat); % bd odtworzenia wektorw x
Xr=X_hat(:); % powrt do penego sygnau dwikowego
soundsc(Xr,fs); % odtworzenie dwiku
bar(diag(d)), title('Rozkad wartoci wasnych')
Error_Rxx/norm(Rxx);
Error_X/norm(X);