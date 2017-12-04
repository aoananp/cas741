function [xarr, yarr, success] = heun(f, x_0, y_0, x_k, h)
success = false;
syms x y;
slopeleft = 0.0;
sloperight = 0.0;
try
    xarr(1) = x_0;
    yarr(1) = y_0;
    i = 1;
    N = round(abs(x_k - x_0)/h);
    for i = 1: N
        xarr(i + 1)= xarr(i) + h;
        slopeleft = subs(f, [x, y], [xarr(i), yarr(i)]);
        sloperight = subs(f, [x, y], [xarr(i) + h, yarr(i) + (h * slopeleft)]);
        yarr(i + 1)= yarr(i) + (h/2) * (slopeleft + sloperight) ;
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