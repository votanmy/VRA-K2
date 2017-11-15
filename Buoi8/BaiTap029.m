function BaiTap029()
    strFolderDataTrain = fullfile('DataTrain');
    categories = {'0','1','2','3','4','5','6','7','8','9'};
    imdsDataTrain = imageDatastore(fullfile(strFolderDataTrain,categories),'LabelSource','foldernames');
    imdsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);
    
    net = alexnet();
    featureLayer = 'fc7';   % or 'fc6'
    featuresDataTrain = activations(net,imdsDataTrain,featureLayer,'MiniBatchSize',32,'OutputAs','columns');
    lblDataTrain = imdsDataTrain.Labels;
    
    % Fit multiclass models for support vector machines 
    classifier = fitcecoc(featuresDataTrain,lblDataTrain,'Leaners','Linear','Coding','onevsall','ObservationsIn','columns');
    
    strFolderDataTest = fullfile('DataTest');
    categories = {'0','1','2','3','4','5','6','7','8','9'};
    imdsDataTest = imageDatastore(fullfile(strFolderDataTest,categories),'LabelSource','foldernames');
    imdsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);
    
    featuresDataTest = activations(net,imdsDataTest,featureLayer,'MiniBatchSize',32);
    lblActualDataTest = imdsDataTest.Labels;    
    
    lblResult = predict(classifier, featuresDataTest);
    nResult = (lblActualDataTest == lblResult);
    nCount = sum(nResult);
    fprintf('\nSo luong mau nhan dang dung: %d\n', nCount);    
end