function BaiTap027()
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    nBins = 256;
    nTrainImages = size(imgTrainAll,2);
    imgTrainAll_hist = zeros(nBins,nTrainImages);
    for i=1:nTrainImages
        imgTrainAll_hist(:,i) = imhist(imgTrainAll(:,i),nBins);
    end
    
    % Fit multiclass models for support vector machines
    Mdl = fitcecoc(imgTrainAll_hist', lblTrainAll);
    
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTestImages = size(imgTestAll,2);
    imgTestAll_hist = zeros(nBins,nTestImages);
    for i=1:nTestImages
        imgTestAll_hist(:,i) = imhist(imgTestAll(:,i),nBins);
    end    
    
    lblResult = predict(Mdl, imgTestAll_hist');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);   %  3475
end