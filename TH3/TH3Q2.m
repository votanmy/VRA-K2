function TH3Q2(n)
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');   
    
    nTestImages = size(imgTestAll, 2);
    
    if n>0 && n<=nTestImages
        figure;
        imgN = imgTestAll(:,n);
        img2DN = reshape(imgN, 28, 28);
        strLabelImage = num2str(lblTestAll(n));
        imshow(img2DN);
        title(strLabelImage);  
    end
end