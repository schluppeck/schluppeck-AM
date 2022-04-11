%% courselogo() 
%
% A function to make the nottingham matlab course logo
%
function [  ] = courselogo(exportFilename)
%courselogo - make the nottingham matlab course logo
%
%      usage: [  ] = courselogo(  )
%         by: ds1
%       date: Nov 26, 2013
%        $Id$
%     inputs: exportFilename
%    outputs: 
%
%    purpose: make course logo for matlab course
%
%        e.g: 

if nargin < 1
    exportFilename = [];
end

%% Logo
L = (40*membrane(1,50));

%% Figure without tickmarks
figure, imagesc(L)

% from R2014b onwards the colourmap |parula| is available
if ~verLessThan('matlab','8.4')
    colormap(parula)
else
    colormap(jet)
end

set(gca,'xtick',[], 'ytick',[])
axis square

%% export to a file?
if ~isempty(exportFilename)
    
    L = L./max(L(:));
    try
       imwrite(gray2ind(L,256),hot(256),exportFilename,'png');
    catch
       disp(['(uhoh) problem writing the file ' exportFilename])
    end
    
    
end

end
