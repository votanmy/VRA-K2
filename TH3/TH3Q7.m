function TH3Q7(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');  
    
    Mdl = fitcknn(imgTrainAll',lblTrainAll);
    
    nTestImages = size(imgTestAll, 2);

    if n>=0 && n<10
        count = 0;
        for t=1:nTestImages
            if(lblTestAll(t) == n)
                imgTest = imgTestAll(:,t);
                lblPredictTest = predict(Mdl,imgTest');
                if(lblPredictTest ~= n)
                    count = count+1;
                end
            end
        end
        fprintf('So luong du doan sai so %d: %d\n',n,count);
    end
end