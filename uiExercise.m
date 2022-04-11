%uiExercise - demonstration of questdlg - dialog
%
%         by: lpzds1
%       date: Apr 13, 2014
%        $Id$
%
%    purpose: show off how to use questdlg function to ask users questions.
%

% this is a minimal example for asking user about options::
	  
ButtonName = questdlg('What is your favorite beverage?', ...
             'Drinks Question', ...
             'Espresso', 'Americano', 'Green Tea', ...
             'Espresso');

% The following inputs to the questdlg function are:
% 1: **question**, 
% 2: **window name**, 
% 3-5: **options** that the user will have 
% last: **default**, the default that will be selected on the window

% questdlg returns a string ``ButtonName`` - can test what got returned:

% switch/case is much more elegant than a if/else in this case:

switch ButtonName,
    case {'Espresso', 'Americano'},
        disp('a kind of coffee');
        % could also put other coffee-specific code here
        % Note the use of curly braces { }  this is actually a cell array
    case {'Green Tea'},  
        % the { } are not actually needed for one option only ...
        disp('healthy option!');
end





