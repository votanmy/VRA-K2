function TH3Q6(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');  
    
    Mdl = fitcknn(imgTrainAll',lblTrainAll);
    
    nTestImages = size(imgTestAll, 2);    
    
    if n>0 && n<=nTestImages
        imgTest = imgTestAll(:,n);
        lblPredictTest = predict(Mdl,imgTest');

        lblImageTest = lblTestAll(n);

        figure;
        img2D = reshape(imgTest, 28, 28);
        imshow(img2D);
        strLabelImage = 'Ban dau ';
        strLabelImage = [strLabelImage, num2str(lblImageTest), '.'];
        strLabelImage = [strLabelImage, ' Du doan: '];
        strLabelImage = [strLabelImage, num2str(lblPredictTest), '.'];

        if(lblPredictTest == lblImageTest)
            strLabelImage = [strLabelImage, ' Ket qua dung. '];
        else
            strLabelImage = [strLabelImage, ' Ket qua sai. '];
        end

        title(strLabelImage);
    end
end