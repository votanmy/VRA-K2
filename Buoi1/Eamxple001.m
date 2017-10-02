% Tao ngau nhien mot so thuc troong doan [0 1]
% Tao ngau nhien mot so ngueyn trong doan [1 10]
% Tao ngau nhien mot matrix kich thuoc 1x10 cac so nguyen nam trong [-10 10]
function Eamxple001()
a=rand();
fprintf('\n So thuc ngau nhien trong [0 1]:[%8.3f]',a);
r=randi([1 10]);
fprintf('\n So nguyen ngau nhien trong [1 10]: [%d]',r);
rArray = randi([-10 10],1,10);
fprintf('\n Size cua rArray: %d',size(rArray,2));
fprintf('\n Mang rArray duoc tao la: ');
fprintf('[%2d]', rArray);
end