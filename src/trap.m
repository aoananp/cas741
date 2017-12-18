%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Trapezoidal ODE Module
% Created by: Paul Aoanan
% Properties: This module contains the logic for the ODE Solver using the Trapezoidal Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [xarr, yarr, success] = trap(f, x_0, y_0, x_k, h)
yahead = 0.0;
success = false;
syms x y;
try
    xarr(1) = x_0;
    yarr(1) = y_0;
    i = 1;
    N = round(abs(x_k - x_0)/h);
    for i = 1: N
        xarr(i + 1)= xarr(i) + h;
        yahead = yarr(i) + h * subs(f, [x, y], [xarr(i), yarr(i)]);
        yarr(i + 1)= yarr(i) + (h/2) * (subs(f, [x, y], [xarr(i), yarr(i)]) + subs(f, [x, y], [xarr(i + 1), yahead]));
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