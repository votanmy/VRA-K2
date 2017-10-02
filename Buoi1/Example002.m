% Bien matrix
% Nhap 2 so nguyen m, n tu ban phim
% Tao matrix a kich thuoc mxn toan so 1
% Tao matrix b kich thuoc mxn toan so 0
% Tao matrix c kich thuoc mxn co mot matrix con kich thuoc
% (min(m,n) x min(m,n)) la matrix don vi
% Tao matrix d kich thuoc mxn voi cac gia tri ngau nhien nam trong [-10,10]
% Gan phan tu a(1,1) = 5
% Tao matrix e voi cac phan tu la kich thuoc cua matrix a
function Example002()
strMessage = '\n Nhap m:';
m = input(strMessage);
strMessage = '\n Nhap n:';
n = input(strMessage);
a = ones(m,n);
b = zeros(m,n); 
c = eye(m,n);
d =  randi([-10,10],m,n);
a(1,1) = 5;
fprintf('[%2d]', a);
e = size(a);
end