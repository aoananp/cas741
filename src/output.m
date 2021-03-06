%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Output Module
% Created by: Paul Aoanan
% Properties: This module contains the output logic for LODES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output(x, y, toPlot, displayResult, ODE_method)
if toPlot
    methodString = '';
    figure('Name', 'LODES Plot', 'NumberTitle', 'off')
    plot(x, y, '-o');
    switch ODE_method
        case 1
            methodString = 'Euler''s Method';
        case 2
            methodString = 'Trapezoidal Method';
        case 3
            methodString = 'Heun''s Method';
        case 4
            methodString = 'Runge-Kutta 4 Method';            
    end
    title(strcat('Graph of y vs x of the solution to the ODE IVP using', 32, methodString))
    xlabel('x-values')
    ylabel('y-values')
end
if displayResult
    fprintf('The values of x are: ');
    disp(x);
    fprintf('The values of y are: ');
    disp(y);
end
end