classdef testClasses < matlab.unittest.TestCase
    properties
    end
    
    methods (Test)
        function testLODESSolution1(test1)
            tolerance = eps;
            ODE_string = 'y';
            x_0 = 0;
            y_0 = 1;
            x_k = 2;
            h = 0.25;
            toPlot = false;
            [yeuler, ytestarr, norm, errorarray] = lodestest(1, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(yeuler, ytestarr, 'RelTol', tolerance);
            [ytrap, ytestarr, norm, errorarray] = lodestest(2, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(ytrap, ytestarr, 'RelTol', tolerance);
            [yheun, ytestarr, norm, errorarray] = lodestest(3, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(yheun, ytestarr, 'RelTol', tolerance);
            [yrk, ytestarr, norm, errorarray] = lodestest(4, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(yrk, ytestarr, 'RelTol', tolerance);
        end
        function testLODESSolution2(test1)
            tolerance = eps;
            ODE_string = 'x^2 - 3*y';
            x_0 = 0;
            y_0 = 1;
            x_k = 2;
            h = 0.25;
            toPlot = false;
            [yeuler, ytestarr, norm, errorarray] = lodestest(1, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(yeuler, ytestarr, 'RelTol', tolerance);
            [ytrap, ytestarr, norm, errorarray] = lodestest(2, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(ytrap, ytestarr, 'RelTol', tolerance);
            [yheun, ytestarr, norm, errorarray] = lodestest(3, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(yheun, ytestarr, 'RelTol', tolerance);
            [yrk, ytestarr, norm, errorarray] = lodestest(4, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 0)
            test1.verifyEqual(yrk, ytestarr, 'RelTol', tolerance);
        end

    end
end

