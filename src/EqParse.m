%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Equation Parser Module
% Created by: Paul Aoanan
% Properties: This module contains the logic for parsing the user input
% ODE string.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [f, eq_OK] = EqParse(ODE_eq)
eq_OK = false;
try
    
    f = str2func(strcat('@(x, y)', 32, ODE_eq));
    eq_OK = true;
    return
catch e
    fprintf(1,'The identifier was:\n%s',e.identifier);
    fprintf(1,'There was an error! The message was:\n%s',e.message);
    f = 0;
    return
end

    
    
    