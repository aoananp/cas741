function [xarr, yarr, success] = rk(f, x_0, y_0, x_k, h)
success = false;
syms x y;
double k1;
double k2;
double k3;
double k4;
try
    xarr(1) = x_0;
    yarr(1) = y_0;
    i = 1;
    N = round(abs(x_k - x_0)/h);
    for i = 1: N
        xarr(i + 1)= xarr(i) + h;
        k1 = subs(f, [x, y], [xarr(i), yarr(i)]);
        k2 = subs(f, [x, y], [xarr(i) + h/2, yarr(i) + h * (k1/2)]);
        k3 = subs(f, [x, y], [xarr(i) + h/2, yarr(i) + h * (k2/2)]);
        k4 = subs(f, [x, y], [xarr(i) + h, yarr(i) + h * k3]);
        yarr(i + 1)= yarr(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
    success = true;
    return
catch e
    fprintf(1,'The identifier was:\n%s',e.identifier);
    fprintf(1,'There was an error! The message was:\n%s',e.message);
    success = false;
    x = zeros;
    y = zeros;
    return
end
end