%% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'/Users/lpzds1/Desktop/spmDemo/myMotionComp_job.m'};

%%
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);


% %%
% theSubjID = 01; %  '%0d'
% nrun = 10;
% for crun = 1:nrun
%   
%     % example idea (won't work with the data we have here, but explains the
%     % general idea)
%     % filenames: subj01_run01.nii
%     
%     datafilename = sprintf('sub%02d_run%02d.nii', theSubjID, crun )
%     
% end


%%
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
