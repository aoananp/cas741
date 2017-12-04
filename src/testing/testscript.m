%Complete System and Functional Testing
clc;
tests = testClasses;
result = run(tests)

%Test to show graph
[ylodes, yy, errornorm, splineerror] = lodestest(4, 'x^2 - 3*y', 0, 1, 2, 0.025, true, 0, 0)
