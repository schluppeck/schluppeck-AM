%% Indexing / overview
%
% Some material to show the different ways in which INDEXING works in
% matlab
%
% ds 2018/04/13
%
% h/t some answers on matlab central that were super useful for displaying!
%
% https://uk.mathworks.com/matlabcentral/answers/25038-how-to-change-each-cell-color-in-a-uitable

% function for rendering HTML table inside UI
colergen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];

% make a figure
f_ = figure();

set(f_, 'units', 'normalized', 'toolbar', 'none', 'dockcontrols', 'off', 'menubar', 'none');
data = num2cell(randi(99, 20, 5));

uitable(f_, 'data', data, 'units', 'normalized', 'Position', [0.05, 0.05, 0.9, 0.9], 'backgroundcolor', [1 1 1])