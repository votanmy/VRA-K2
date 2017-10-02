% HAM 03
% Luu N so nguyen to
% Tim n so nguyen to dau tien
% Luu n so nguyen to nay ra tap tin "prime<n>.mat"
function savenprime(n)
    rArray = findnprime(n);
    strFileName = ['prime',num2str(n),'.mat'];
    save(strFileName, rArray);
end