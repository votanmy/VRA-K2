function BaiTap028()
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    nBins = 144;
    nTrainImages = size(imgTrainAll,2);
    imgTrainAll_hog = zeros(nBins,nTrainImages);
    for i=1:nTrainImages
        imgI = imgTrainAll(:,i);
        img2D = reshape(imgI,28,28);
        [featureVector,hogVisualization] = extractHOGFeatures(img2D);
        imgTrainAll_hog(:,i) = featureVector;
    end
    
    % Fit multiclass models for support vector machines 
    Mdl = fitcecoc(imgTrainAll_hog', lblTrainAll);
    
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTestImages = size(imgTestAll,2);
    imgTestAll_hog = zeros(nBins,nTestImages);
    for i=1:nTestImages
        imgI = imgTestAll(:,i);
        img2D = reshape(imgI,28,28);
        imgTestAll_hog(:,i) = extractHOGFeatures(img2D);        
    end    
    
    lblResult = predict(Mdl, imgTestAll_hog');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);   % 9794
end