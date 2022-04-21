function out = myExtendibleFunction(in)
% myExtendibleFunction - shows how to use STUCTS to "retrofit" function
%
% ie add additional input arguments / and general stuff, without
% having to rewrite tons of code.

% in will be a struct, so we access to all of the sub-compartments
theFieldnames = fieldnames(in);

firstField = theFieldnames{1};

keyboard


out = in.Date;


end