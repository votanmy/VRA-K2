% Van De 01
% Nap du lieu train & test cua bai toan nhan dang chu viet tay
function Recognition001_Digits()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');    
    fprintf('\n Ket thuc \n');
    
    Anh1 = reshape(imgTrainAll(:,100),28,28);
    imshow(Anh1);
end