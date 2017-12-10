%Complete System and Functional Testing
clc;
tests = testClasses;
result = run(tests)

%Test to show graph
[ylodes, yy, errornorm, splineerror] = lodestest(4, 'y', 0, 1, 2, 0.25, true, 0, 0)
