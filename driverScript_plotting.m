%% driver script for showing how to repeat the same job multiple times
%  
%
% ds 2022-04-21

%% this script will start with a clean slate
clear all
close all

%% load in fixation data
load('exFixation.mat')

%% make sure I can create one plot
currentTrial = 1;

f_ = figure()
plotFixations(datax, datay, currentTrial)
% idea: add a title to the top of the window

%% loop over all trials and create N plots
nTrials = size(datax, 2);

for iTrial = 1:nTrials 
    figure()
    plotFixations(datax, datay, iTrial);
end


