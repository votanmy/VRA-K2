% HAM 01
% Ham kiem tra nguyen to
% Ham tra ve 1: so n la so nguyen to
% Ham tra ve 0: so n khong la so nguyen to
function m = isprime(n)
    count = 0;
    for i=1:n
        if(mod(n,i)==0)
            count = count + 1;
        end
    end
    m = (count==2);
end