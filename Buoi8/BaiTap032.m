function BaiTap032()
    strFolderDataTrain = fullfile('DataTrain');
    categories = {'0','1','2','3','4','5','6','7','8','9'};
    imdsDataTrain = imageDatastore(fullfile(strFolderDataTrain,categories),'LabelSource','foldernames');
    imdsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);
    
    net = alexnet();
    featureLayer = 'fc7';   % or 'fc6'
    featuresDataTrain = activations(net,imdsDataTrain,featureLayer,'MiniBatchSize',32,'OutputAs','columns');
    lblDataTrain = imdsDataTrain.Labels;
    
    % Fit discriminant analysis classifier
    knnMdl = fitcdiscr(featuresDataTrain',lblDataTrain);
    
    strFolderDataTest = fullfile('DataTest');
    categories = {'0','1','2','3','4','5','6','7','8','9'};
    imdsDataTest = imageDatastore(fullfile(strFolderDataTest,categories),'LabelSource','foldernames');
    imdsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);
    
    featuresDataTest = activations(net,imdsDataTest,featureLayer,'MiniBatchSize',32);
    lblActualDataTest = imdsDataTest.Labels;    
    
    lblResult = predict(knnMdl, featuresDataTest);
    nResult = (lblActualDataTest == lblResult);
    nCount = sum(nResult);
    fprintf('\nSo luong mau nhan dang dung: %d\n', nCount);    
end