%% this is a driver script for showing off
%. the ideas around myExtendibleFunction()
%
% ds 2022-04-21

%%
%someInput = 10;
someInput = struct('nParticipants', 10, 'Date', date(), 'Location', 'Nottingham', 'StudyName', 'VisionExp1');


%%
someOutput = myExtendibleFunction(someInput)