function BaiTap015()
    % Giong nhu Baitap014 nhung tao cac ham thuc thi tac vu rieng
    % Load data train    
    strData = 'train-images.idx3-ubyte';
    strDataLabel = 'train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);
    
    % Extract features    
    featuresDataTrain = extractFeaturesHOG(imgDataTrain);
    
    % Build model KNN
    Mdl = fitcknn(featuresDataTrain',lblDataTrain);
    
    % Load data test    
    strData = 't10k-images.idx3-ubyte';
    strDataLabel = 't10k-labels.idx1-ubyte';
    [imgDataTest,lblActualDataTest] = loadData(strData,strDataLabel); 

    % Extract features    
    featuresDataTest = extractFeaturesHOG(imgDataTest);    
    
    % Save result
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblActualDataTest);    
    nCount = sum(nResult);    
    fprintf('\n So luong mau dung: %d\n',nCount);    % CellSize = 8x8: 9709. CellSize = 4x4: 9767
end