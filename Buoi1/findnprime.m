% HAM 02
% Ham tim N nguyen to
% Dinh nghia ham n so nguyen to dau tien
% Ham tra ve mot mang co n phan tu tuong ung voi n so nguyen to dau tien
% duoc tim thay
function primeArray = findnprime(n)
    count = 0;
    i = 2;
    primeArray = [];
    while (count<n)
        if(isprime(i)==1)
            count = count + 1;
            primeArray = [primeArray,i];
        end
        i = i +1;
    end
end