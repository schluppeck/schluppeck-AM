%% Trying out things in scripts / cell mode
%
% Denis Schluppeck, University of Nottingham
%
%% Quick prototyping with cells
%
% If you want to
% Two %% signs at the beginning of a line mark the start of a cell. When
% the cursor is inside, the cell is highlighted and you can use the "Run
% Section" button in the Editor control bar to run the bits of the code
% that are in this cell.
%
% If you want to do several sections in sequence, you could also "Run and
% Advance".
%
% In addition to being neat for trying things out, you can also "publish"
% scripts like this to HTML, PDF or similar... which makes it useful for
% sharing your work with others.

%% Start with a clean slate
clear all
close all

%% Make a figure

% we want to always use the window number 1 here, so specify it 
figure(1)

% our x-axis will also stay the same
x = linspace(0,1, 25);

%% Decide on some numbers to plot

% but we want to change this parameter here and see the effect of changing
% it, say, between 0.5 and 8

a = 3; % a parameter you want to set

% For publishing, you can also include equations ($\LaTeX$ format)and
% markup. A simple equation $y(x) = x^a e^x$ 
%
% *bold text* looks like this
% _italic text_ 
% |monospace / typewriter text|
% and even links to webpages 
% <http://www.mathworks.com MathWorks>

y = x.^a .* exp(x);

% make a plot

myRandomPlotColor = rand(1,3); % makes a 1-by-3 vector for a random RGB color
plot(x,y,'linewidth',1.5, 'color', myRandomPlotColor);

% and |hold on| to keep the plots for different iterations
hold on

%% and add some decorations to the plot:

title('My plot with different a''s ')
xlabel('x axis')
ylabel('y axis')


