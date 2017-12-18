%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Interface Module
% Created by: Paul Aoanan
% Properties: This module contains the interface module for LODES. This
% module is exposed to the user.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x, y, success] = lodes(ODE_method, ODE_eq, x_0, y_0, x_k, h, plot, displayResult)
x = zeros;
y = zeros;
success = false;
f = 0;

eq_OK = false;

try
    [f, eq_OK] = EqParse(ODE_eq);

    if ~(eq_OK)
        %badODEEq = true;
        print('Bad ODE Equation input.') %badODEEq
        return
    end
    if ~(isreal(x_0))
        %badX0 = true;
        print('Bad x_0 input.') %badX0
        return
    end
    if ~(isreal(y_0))
        %badY0 = true;
        print('Bad y_0 input.') %badY0
        return
    end
    if ~(isreal(x_k) && (x_k > x_0))
        %badXK = true;
        print('Bad x_k input.') %badXK
        return
    end
    if ~(isreal(h) && (h > 0))
        %badH = true;
        print('Bad h input.') %badH
        return
    end

    switch ODE_method
        case 1
            [x, y, success] = eul(f, x_0, y_0, x_k, h);
        case 2
            [x, y, success] = trap(f, x_0, y_0, x_k, h);
        case 3
            [x, y, success] = heun(f, x_0, y_0, x_k, h);
        case 4
            [x, y, success] = rk(f, x_0, y_0, x_k, h);

    end
    if success
        output(x, y, plot, displayResult, ODE_method);
    end
    return
catch e
    fprintf('Failed to execute lodes.');
    fprintf(1,'The identifier was: \n%s',e.identifier);
    fprintf(1,'There was an error! The message was: \n%s',e.message);
    success = false;
    x = zeros;
    y = zeros;
    return
end
end
