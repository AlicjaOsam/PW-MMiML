num_class = 5;                      % Number of classes to read 
num_images = 200;                   % Number of images in each class   
dataFolder = fullfile(toolboxdir('nnet'),'nndemos','nndatasets','DigitDataset'); 
images = imageDatastore(dataFolder, ...     
    'IncludeSubfolders',true, ....     
    'LabelSource','foldernames');   
input_data = []; 
labels = []; 
for i = 0 : num_class-1     
    subset = images.Files(images.Labels == num2str(i));     
    for j = 1 : num_images         
        image = imread(subset{j});         
        vec = reshape(image, 1, []);  % Image flatten         
        input_data = [input_data; vec];         
        labels = [labels; categorical(i)];     
    end 
end   
input_data = im2double(input_data);   
[~,Y_pca] = pca(input_data);          % Dimensionality reduction 
Y_tsne = tsne(input_data);   
figure,  
subplot(1,2,1), scatter(Y_pca(:,1), Y_pca(:,2), 50, labels, 'filled'), grid on, title('PCA'), colormap(jet(size(Y_pca,1))) 
subplot(1,2,2), scatter(Y_tsne(:,1), Y_tsne(:,2), 50, labels, 'filled'), grid on, title('TSNE'), colormap(jet(size(Y_tsne,1))) 