function [featuresData]=extractFeaturesHOG(imgData)
    imgI1D = imgData(:,1);
    imgI2D = reshape(imgI1D,28,28);    
    %[featureVector,hogVisualization] = extractHOGFeatures(imgI2D);                 % Mac dinh CellSize = 8x8
    [featureVector,hogVisualization] = extractHOGFeatures(imgI2D,'CellSize',[4 4]); % Custom CellSize = 4x4    
    nSize = length(featureVector);
    nData = size(imgData,2);        
    featuresData = zeros(nSize,nData);
    for i=1:nData
        imgI1D = imgData(:,i);
        imgI2D = reshape(imgI1D,28,28);
        featuresData(:,i) = extractHOGFeatures(imgI2D,'CellSize',[4 4]);
    end    
end