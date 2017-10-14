function TH3Q5(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');  
    
    Mdl = fitcknn(imgTrainAll',lblTrainAll);
    
    nTestImages = size(imgTestAll, 2);
    
    if n>0 && n<=nTestImages
        imgTest = imgTestAll(:,n);
        lblPredictTest = predict(Mdl,imgTest');
        fprintf('Ket qua du doan anh test co thu tu n=%d la: %d\n',n,lblPredictTest);
    end
end