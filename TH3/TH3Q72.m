function TH3Q72(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');  
    
    Mdl = fitcknn(imgTrainAll',lblTrainAll);
  
    numMat = unique(lblTestAll);                        % Loai cac label trung nhau.
    confMat = [numMat zeros(size(numMat,1),1)];         % Tao confusion matrix
    
    if n>=0 && n<10
        q = find(lblTestAll == n);                      % Tim trong lblTestAll tat ca cac chi so ma co gia tri la n. q la matrix chi so dong
        nTestImages = size(q,1);                        % Tinh tong so anh co nhan la n   
        for t=1:nTestImages
            imgTest = imgTestAll(:,q(t));               % Lay anh test co chi so q(t)
            lblPredictTest = predict(Mdl,imgTest');
            
            if(lblPredictTest == n)
                rowID = find(numMat == n);              % Lay chi so dong cua numMat co gia tri la n               
            else          
                rowID = find(numMat == lblPredictTest); % Lay chi so dong cua numMat co gia tri la lblPredictTest
            end
            confMat(rowID,2)= confMat(rowID,2) + 1;     % Tang so luong du doan
        end
        fprintf('Confusion matrix du doan label co nhan la %d:\n',n);
        disp(confMat');
    end
end