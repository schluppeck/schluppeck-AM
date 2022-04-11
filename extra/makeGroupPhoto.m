function [ img ] = makeGroupPhoto(theFiles)
%makeGroupPhoto - create a montage of all images in a directory
%
%      usage: [ img ] = makeGroupPhoto( theFiles )
%         by: lpzds1, Denis Schluppeck
%       date: Apr 07, 2018
%        $Id$
%     inputs: theDirectory (required)
%    outputs: img
%
%    purpose: use the matlab montage function to create a nice grid of
%    images of attendees on the course. 
%    
%    assumes you are using a relative path to current working dir.
%
%        e.g:   
%             makeGroupPhoto('brains/*.png')  % all PNG images in this folder
%             

if nargin < 1
    help makeGroupPhoto
    return
end

% get files that match this pattern
thePath = fullfile(pwd, theFiles );
fprintf('Using path: %s\n', thePath);
dirOutput = dir( thePath );

% patch together absolute paths:
fileNames = cellfun(@(x,y) fullfile(x,y),{dirOutput.folder}', {dirOutput.name}', 'UniformOutput',false)

nFiles = numel(fileNames);

if nFiles < 1
    error('UHOH - nothing there to montage')
end

% work out how the grid size...
% sqrt(nFiles) if there are n^2 images... 
% make the montage a bit taller by forcing the # of rows to CEIL.

nRows = ceil( sqrt(nFiles) );
montage(fileNames, 'Size', [nRows nan]);  % with NAN... montage works out the correct # of columns

end