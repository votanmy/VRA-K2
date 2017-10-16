function demoHog()
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    imgI1D = imgTrainAll(:,1968);
    imgI2D = reshape(imgI1D,28,28);
    
    subplot(2,5,1);
    imshow(imgI2D);
    
    [featureVector,visualHog] = extractHOGFeatures(imgI2D,'CellSize',[2 2]);
    subplot(2,5,2);
    plot(visualHog);
    
    [featureVector,visualHog] = extractHOGFeatures(imgI2D,'CellSize',[4 4]);
    subplot(2,5,3);
    plot(visualHog);  
    
    [featureVector,visualHog] = extractHOGFeatures(imgI2D,'CellSize',[8 8]);
    subplot(2,5,4);
    plot(visualHog);     

    subplot(2,5,5);    
    hist(featureVector);
    
    imgI1D = imgTrainAll(:,1993);
    imgI2D = reshape(imgI1D,28,28);    

    subplot(2,5,6);
    imshow(imgI2D);    
    
    [featureVector,visualHog] = extractHOGFeatures(imgI2D,'CellSize',[2 2]);
    subplot(2,5,7);
    plot(visualHog);
    
    [featureVector,visualHog] = extractHOGFeatures(imgI2D,'CellSize',[4 4]);
    subplot(2,5,8);
    plot(visualHog);  
    
    [featureVector,visualHog] = extractHOGFeatures(imgI2D,'CellSize',[8 8]);
    subplot(2,5,9);
    plot(visualHog);     

    subplot(2,5,10);    
    hist(featureVector);    
    
end