function [ h ] = interactWithPlot(varargin)
%interactWithPlot - show how to wrap plot() inside a function that changes properties
%
%      usage: [ h ] = interactWithPlot( varargin )
%         by: ds1
%       date: Apr 17, 2014
%        $Id$
%     inputs: varargin
%    outputs: h
%
%    purpose: call this function like you would plot(). Check out how we
%             pass on input arguments to the other function. the added
%             bells and whistles here are that we'll hook up a callback
%             function to the window such that pressing 'c' will change the
%             plot color and 's' the symbols
%                c - color change
%                s - symbol change
%                q - quit
%
%        e.g:
%               x = 1:50;
%               y = rand(1,length(x));
%               interactWithPlot(x,y); % the press 'c' and 's' to change
%
if nargin < 1
    error('(interactWithPlot) can''t plot nothing! uhoh.')
end

% new figure - saving its handle
f_ = figure();

% plot the data (passing on everything that was passed in)
p_ = plot( varargin{:} ); % expand all the arguments passed in.

% hook up a key press function
% the '@' symbol means that "keypress" is expected to be a function
% now every time a key is pressed when this window is active,
% the functon 'keypress' gets called
set(f_, 'WindowKeyPressFcn', @keypress);

% to be able to replot in a sub-functions, we need to pass data around
% store everything you might need:

data.f_ = f_; % figure handle.  use  | get(f_) | to see what's in there
data.p_ = p_; % plot handle. use  | get(p_) | to see what's in there
data.arsToFunction = varargin;
% everyhing else we need should be accessible via the handles

set(f_, 'UserData', data); % this sets the UserData field

end

% callback function(s)

function keypress(h, evnt)
% the function takes two inputs and runs specific code depending
% on which button was pressed
%
% -- the HANDLE to the figure
% -- and specifics about what happened

% "unpack" the UserData
data = get(h,'UserData');

% now you can do specific things according to which button was pressed
% convert the field "Key" to lower case and choose what to do
%
% could use IF statements, but the SWITCH/CASE version is neater


switch lower(evnt.Key)
    case 'c'
        disp('color change')
        % either make a function that gets called... or if only brief bits
        % of code, right in place:
        newColor = rand(1,3); % random color, literally:
        set(data.p_, 'color', newColor);
        
    case 's'
        disp('symbol change')
        someMarkers = {'.','x','*','o','s','p','d'};
        randomIndex = randsample(numel(someMarkers),1); % pick a number
        set(data.p_, 'marker', someMarkers{randomIndex} ); % pick the symbols
    case {'q','escape'}
        disp('quit')
        close(h); % close the window
        return;   % and return; nothing else to do, so this means we're done
    
    otherwise
        disp('-- some other key / not of interest')
end

% "repack" UserData before function returns
set(h,'UserData', data);

end
