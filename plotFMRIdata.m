%% plotFMRIdata - plot fMRI timecourses
%
function [ h ] = plotFMRIdata(filename)
%plotFMRIdata - main function that loads fMRI data and calls other functions for plotting
%
%      usage: [ h ] = plotFMRIdata(  )
%         by: ds1
%       date: Apr 17, 2014
%        $Id$
%     inputs: filename [name of data file], timecourse.mat is default
%    outputs: h [ a handle to the figure in which things get plotted)
%
%    purpose: this is the main calling function for a simple fMRI data
%             analysis (using data from single voxels or small ROIS). This
%             umbrella function then calls other functions which solve
%             smaller sub-problems.   
%
%        e.g: 
%               plotFMRIdata()

%% check input arguments:
if nargin < 1
    % filename is not provided
    filename = 'timecourse.mat';
end

%% function for loading data

end