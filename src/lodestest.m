function [ylodes, yy, errornorm, splineerror] = lodestest(ODE_method, ODE_eq, x_0, y_0, x_k, h, toPlot, displayResult, toSave)
%Herein lies the test interface code to be used for the LODES library.

% Initialize variables
f = 0;
eq_OK = false;
xtestarr = zeros;
ytestarr = zeros;
xlodes = zeros;
ylodes = zeros;
successlodes = 0;


% Error Spline variables
splinediff = zeros;
splineerror = zeros;
splineerrorpercent = zeros;
errornorm = 0;

xspan = [x_0 x_k];

%Create ODE45eq function input by building anonymous function
ode45eq = str2func(strcat('@(x, y)', 32, ODE_eq));
%Code below uses EqParse for testing - not good as we've used modules that
%are being tested as tools for testing. Kept for reference.
%[f, eq_OK] = EqParse(ODE_eq);

try
    [xtestarr, ytestarr] = ode45(ode45eq, xspan, y_0);
    [xlodes, ylodes, successlodes] = lodes(ODE_method, ODE_eq, x_0, y_0, x_k, h, 0, 0);
    
    %Or use splines and evaluate where the LODES points are for ODE45
    yy = spline(xtestarr, ytestarr, xlodes);
    for i = 1:length(ylodes)
        splinediff(i) = abs(yy(i) - ylodes(i));
        splineerror(i) = splinediff(i) / yy(i);
        splineerrorpercent(i) = 100 * splineerror(i);
    end
    %errornorm = ||ytest - ymatlab||/||ymatlab||
    errornorm = norm(splinediff)/norm(yy);

    if (toPlot && successlodes)
        figure('Name', 'LODES vs MATLAB ODE45 ODE Solvers', 'NumberTitle', 'off')
        plot(xtestarr, ytestarr, '-x', xlodes, ylodes, '-o')
        title('Comparison of LODES and MATLAB ODE45 function')
        xlabel('x');
        ylabel('y');
        legend('ODE45', 'LODES');
        if(toSave)
            saveas(gcf, strcat(num2str(ODE_method),'LODESvsMATLABPlot.jpg'))
        end
        %Display norm error plot
        figure('Name', '% Spline Relative Error', 'NumberTitle', 'off')
        plot(xlodes, splineerrorpercent, '-o', 'Color', [1,0,1]);
        title('% error vs x - Spline Relative Error Comparison between ODE45 and LODES')
        xlabel('x');
        ylabel('% error');
        ylim([0 100])
        if(toSave)
            saveas(gcf, strcat(num2str(ODE_method),'RelativeErrorPlot.jpg'))
        end
    end
    if displayResult
        fprintf('The values of the error vector in percent are: ');
        disp(splineerrorpercent);
    end
catch e
    fprintf(1,'The identifier was: \n%s',e.identifier);
    fprintf(1,'There was an error! The message was: \n%s',e.message);
end
end

