%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Automated Testing Module
% Created by: Paul Aoanan
% Properties: This module is used for LODES' automated testing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            h = 2;
            toPlot = 0;
            [yeuler, ytestarr, norm, errorarray] = lodestest(1, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test1.verifyEqual(yeuler, ytestarr, 'RelTol', tolerance);
            [ytrap, ytestarr, norm, errorarray] = lodestest(2, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test1.verifyEqual(ytrap, ytestarr, 'RelTol', tolerance);
            [yheun, ytestarr, norm, errorarray] = lodestest(3, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test1.verifyEqual(yheun, ytestarr, 'RelTol', tolerance);
            [yrk, ytestarr, norm, errorarray] = lodestest(4, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test1.verifyEqual(yrk, ytestarr, 'RelTol', tolerance);
        end
        function testLODESSolution2(test2)
            tolerance = eps;
            ODE_string = 'y';
            x_0 = 0;
            y_0 = 1;
            x_k = 2;
            h = 0.5;
            toPlot = 0;
            [yeuler, ytestarr, norm, errorarray] = lodestest(1, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test2.verifyEqual(yeuler, ytestarr, 'RelTol', tolerance);
            [ytrap, ytestarr, norm, errorarray] = lodestest(2, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test2.verifyEqual(ytrap, ytestarr, 'RelTol', tolerance);
            [yheun, ytestarr, norm, errorarray] = lodestest(3, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test2.verifyEqual(yheun, ytestarr, 'RelTol', tolerance);
            [yrk, ytestarr, norm, errorarray] = lodestest(4, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test2.verifyEqual(yrk, ytestarr, 'RelTol', tolerance);
        end
        function testLODESSolution3(test3)
            tolerance = eps;
            ODE_string = 'sin(x) - y^2';
            x_0 = 0;
            y_0 = 1;
            x_k = 5;
            h = 5;
            toPlot = 0;
            [yeuler, ytestarr, norm, errorarray] = lodestest(1, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test3.verifyEqual(yeuler, ytestarr, 'RelTol', tolerance);
            [ytrap, ytestarr, norm, errorarray] = lodestest(2, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test3.verifyEqual(ytrap, ytestarr, 'RelTol', tolerance);
            [yheun, ytestarr, norm, errorarray] = lodestest(3, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test3.verifyEqual(yheun, ytestarr, 'RelTol', tolerance);
            [yrk, ytestarr, norm, errorarray] = lodestest(4, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test3.verifyEqual(yrk, ytestarr, 'RelTol', tolerance);
        end
        function testLODESSolution4(test4)
            tolerance = eps;
            ODE_string = 'sin(x) - y^2';
            x_0 = 0;
            y_0 = 1;
            x_k = 5;
            h = 1;
            toPlot = 1;
            [yeuler, ytestarr, norm, errorarray] = lodestest(1, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test4.verifyEqual(yeuler, ytestarr, 'RelTol', tolerance);
            [ytrap, ytestarr, norm, errorarray] = lodestest(2, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test4.verifyEqual(ytrap, ytestarr, 'RelTol', tolerance);
            [yheun, ytestarr, norm, errorarray] = lodestest(3, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test4.verifyEqual(yheun, ytestarr, 'RelTol', tolerance);
            [yrk, ytestarr, norm, errorarray] = lodestest(4, ODE_string, x_0, y_0, x_k, h, toPlot, 0, 1)
            test4.verifyEqual(yrk, ytestarr, 'RelTol', tolerance);
        end
    end
end

