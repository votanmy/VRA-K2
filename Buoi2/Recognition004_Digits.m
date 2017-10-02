% Van De 04
% Nap du lieu train & test cua bai toan nhan dang chu viet tay
% Hien thi mot anh ngau nhien trong bo du lieu train
% Hien thi mot anh ngau hien trong bo du lieu test
function Recognition004_Digits()

    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');   
    
    nTrainImages = size(imgTrainAll, 2);
    nNumber = randi([1 nTrainImages]);
    
    figure;
    img = imgTrainAll(:, nNumber);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTrainAll(nNumber));
    strLabelImage = [strLabelImage, '(',num2str(nNumber),')'];  % nhan anh(cua anh thu n)
    imshow(img2D);
    title(strLabelImage);

    nTestImages = size(imgTestAll, 2);
    nNumber = randi([1 nTestImages]);
    
    figure;
    img = imgTestAll(:, nNumber);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTestAll(nNumber));
    strLabelImage = [strLabelImage, '(',num2str(nNumber),')'];
    imshow(img2D);
    title(strLabelImage);  
 
end