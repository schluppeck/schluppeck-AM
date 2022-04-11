%% Using C / C++ code to speed up
%
% For very specific use cases, and if you are happy to get your hands dirty
% with a lot more low-level stuff, memory management, types, etc. you can
% also hook up some C-functions.
%
% The way to achieve this in Matlab is to write C-code in a very particular
% way and then compile the code, so that it can be run from withhin matlab
% using the MEX interface.
%
% For _users_ MEX functions behave very much like other matlab functions,
% but for those _programming/writing_ them, a lot more is involved. So
% I'd think about whether you really need this - in some cases going this
% route in unavoidable (e.g. many Psychtoolbox functions had to be written
% this way)
%
%% Getting started
%
% To dip you feet into this lake, have a look at |mexfunction.c|, which is
% an example provided by The Mathworks.
%
% edit([matlabroot '/extern/examples/mex/mexfunction.c']);
%
% To use it on your platform Windows / Mac / Linux, you first need to
% compile it. The function |mex| does this
% 

mex mexfunction.c

% If this works successfully you should now have another file. 
% You need to have a compiler on you machine - on macOS this is all
% included with XCode / Developer tools, which you can download for free.
% 
% Run |mexext| to see what file ending to expect. On my mac it's
% |mexmaci64| which refers to an Intel-Mac, 64-bit architecture

disp(['On this platform, the mex extension is ' mexext() ])

% doc mexext % for more detail

%% First departure from given example
% modify the mexfunction.c file such that it
% 
% # the resulting function will be called |mysum|
% # only accepts *one input argument*, return an error otherwise
% # checks that the input argument is numeric, return an error otherwise
% # returns the sum of all the values in the input as a single number
%
% (In Matlab, you'd just use the |sum| command, which will be equally fast,
% but this here is just for practice



