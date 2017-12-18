%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Automated Testing Script
% Created by: Paul Aoanan
% Properties: Complete System and Functional Testing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
diary('automatedtestoutput.txt');    
diary on ;
tests = testClasses;
result = run(tests)
diary off ;%to avoid print other commands.

%Test to show graph
%[ylodes, yy, errornorm, splineerror] = lodestest(4, 'y', 0, 1, 2, 0.25, true, 0, 0)
