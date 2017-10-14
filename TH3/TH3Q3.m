function numMat = TH3Q3()
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
   
    numMat = unique(lblTrainAll);    
    
    for i=1:size(numMat,1)
        q = find(lblTrainAll == numMat(i));
        numMat(i,2) = size(q,1);
    end   
    csvwrite('ThongKeTrain.csv',numMat');       
end