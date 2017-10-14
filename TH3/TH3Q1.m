function TH3Q1(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    nTrainImages = size(imgTrainAll, 2);
    
    if n>0 && n<=nTrainImages
        figure;
        imgN = imgTrainAll(:,n);
        img2DN = reshape(imgN, 28, 28);
        strLabelImage = num2str(lblTrainAll(n));
        imshow(img2DN);
        title(strLabelImage);  
    end
end