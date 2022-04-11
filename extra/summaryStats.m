function [ summaryStats ] = summaryStats(s)
%summaryStats - calculate mean, median, range
%
%      usage: [ summaryStats ] = summaryStats( s )
%         by: lpzds1, Denis Schluppeck
%       date: Jun 14, 2017
%     inputs: s
%    outputs: summaryStats
%
%    purpose: give a sample of numbers s, calculate mean, median and range 
%    
%
%        e.g: 
%             summaryStats( rand(100,1) )
%      

% check if input is a column or row vec
if ~(iscolumn(s) || isrow(s) )
    error('only implemented for vectors, not matrices')
end

smean = mean(s);
smedian = median(s);
srange = range(s);

summaryStats = [smean, smedian, srange];

disp(['mean: ', num2str(smean), ', median:', num2str(smedian), ', range:' num2str(srange) ]  )

end