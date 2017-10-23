function Baitap24()
    imgI = imread('cameraman.jpg');
    arrPointI = detectHarrisFeatures(imgI);
    imgJ = imread('cameraman30.jpg');
    arrPointJ = detectHarrisFeatures(imgJ);    
    
    [arrfeatureI,arrValidPointI] = extractFeatures(imgI,arrPointI);
    [arrfeatureJ,arrValidPointJ] = extractFeatures(imgJ,arrPointJ);
    
    arrIndexPair = matchFeatures(arrfeatureI,arrfeatureJ);
    arrMathedPointI = arrValidPointI(arrIndexPair(:,1),:);
    arrMathedPointJ = arrValidPointJ(arrIndexPair(:,2),:);        
    
    figure;
    ax = axes;
    showMatchedFeatures(imgI,imgJ,arrMathedPointI,arrMathedPointJ,'montage','Parent',ax);
    title(ax, 'Candidate point matches');
    legend(ax, 'Matched points I','Matched points J');

    figure;
    ax = axes;
    [tform,inliermatchedpointsJ,inliermatchedpointsI] = estimateGeometricTransform(arrMathedPointI,arrMathedPointJ,'similarity');

    showMatchedFeatures(imgI,imgJ,inliermatchedpointsI,inliermatchedpointsJ,'montage','Parent',ax);
    title(ax, 'Matched inlier points');    
end