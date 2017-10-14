function numMat = TH3Q4()
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
   
    numMat = unique(lblTestAll);    
    
    for i=1:size(numMat,1)
        q = find(lblTestAll == numMat(i));
        numMat(i,2) = size(q,1);
    end   
    csvwrite('ThongKeTest.csv',numMat');       
end