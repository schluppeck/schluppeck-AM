function [ stringOut ] = myStringClean(stringIn)
%myStringClean - replcaes white space in input string with _
%
%      usage: [ stringOut ] = myStringClean( stringIn )
%         by: ds1
%       date: Sep 09, 2014
%        $Id$
%     inputs: stringIn
%    outputs: stringOut
%
%    purpose: simple function that fixes a string to not contain whitespace
%    - also serves as example where command syntax is not so good 
%
%        e.g: 
%              myStringClean('a badFilename')
%              myStringClean('a     very   BadFilename')
%              myStringClean('aBetterFilename')

% can use strrep to replace occurences of single white spaces
stringOut = strrep(stringIn, ' ', '_');

% more powerful regular expression syntax (a whole course in itself!)

pat = '\s*'; % any number of whitespace characters
stringOut = regexprep(stringIn, pat, '_');

% csn think of adding in other fixes for bad characters...
%
% +  -> _plus_
% -  -> _minus_
% &  -> _and_
% etc.

% and check if something has actually been changed;
% if in and out are not the same, something has changed!
if ~strcmp(stringIn, stringOut)  
    disp('(myStringClean) changed something!')
end

end