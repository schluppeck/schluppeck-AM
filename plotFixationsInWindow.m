function xy = plotFixationsInWindow(data_x, data_y, trialNum, fixationWindow )
% plotFixationsInWindow - a function that takes x y (t) data and plots one trial
%
% input: data_x, data_y, trialNum (1...10)
%        fixationWindow [xmin, xmax, ymin, ymax]
%.       good numbers might be [65 140 160 260 ]
% ouput: an array with lots of rows (1000), 2 columns (x,y)
%
% example:
%          % assuming datax and datay are loaded
%          plotFixationsInWindow(datax, datay, 3, [65 140 160 260 ])
% 
% ds 2022-04-20 / for matlab course.
 
nInputArgs = nargin();
fprintf('the user called this function with %d input argument\n', nInputArgs );

if nInputArgs ~= 4 
    % then the user didn't give enough input arguments
    error('you need to call this function with 4 input arguments' )
end

if isempty(data_x)
    error('datax cannot be empty')
end


% idea: defensive programming... 
%.      check number of input arguments, more importantly bounds errors

% check if trialNumber is ok
nTrials = size(data_x, 2);
nTimepoints = size(data_x, 1); % we are not using it now...

if trialNum > nTrials || trialNum < 1
    errmsg = ['trialNum needs to be between 1 and ' num2str(size(data_x,2)) ...
        ' but it was ' num2str(trialNum)];
    % error('trialNum needs to be between 1 and size(data_x,2)');
    error(errmsg)
end

%  - idea: grab the correct columns from data_x, data_y
x = data_x(:, trialNum );
y = data_y(:, trialNum );

%% need to think about checking which points are within window
% fixationWindow [xmin, xmax, ymin, ymax]
xmin = fixationWindow(1);
xmax = fixationWindow(2);
ymin = fixationWindow(3);
ymax = fixationWindow(4);

% idea: check which x samples are in window, then same for y
%.      then we need to combine them

xInWindow = (x > xmin) & (x < xmax); % could be any number of points meet this ciriterion
yInWindow = (y > ymin) & (y < ymax); % 
bothInWindow = xInWindow & yInWindow;

% idea: a couple of different ways to show subset of data
% 1) make t axis and then only plot subset of t,x, and t,y values
% 2) (we will use this for now)... nix data points with NAN (plot ignores
% them)

xSubset = x;
xSubset(~xInWindow) = nan;
ySubset = y;
ySubset(~yInWindow) = nan;

% use x/y data to make plot (in three different panels)
subplot(4,1,1)
plot(x, 'b')
hold('on')
% plot(x(bothInWindow), 'r.') % this was broken!
plot(xSubset, 'r.')

subplot(4,1,2)
plot(y)
hold('on')
plot(ySubset, 'r.')

subplot(4,1, [3,4] )
plot(x,y) 
hold('on')
% for the space version of the plot, we can use the 
% logical indexing (which would work for the time plot panels above
% here, we are only intersted in SPACE)
plot(x(bothInWindow),y(bothInWindow), 'r.')
% axis equal
axis('equal')
axis('tight')

%  - to return output.. combine those two columns
xy = [x, y]; % , and ; are the concise way... HORZCAT / VERTCAT

%  - what could possibly go wrong?!
%.   make a note / enact some defensive programming.

end