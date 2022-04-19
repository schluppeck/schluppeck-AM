function [ frame ] = onlineWebcam(doSave, aName)
%onlineWebcam - acquire an image from webcam
%
%      usage: [  ] = onlineWebcam( doSave, aName )
%         by: lpzds1
%       date: 2022 - for matlab course // online
%
%     inputs:  [doSave] true/false - save image to file
%              [aName] e.g. 'denis' - save more details for montage
%                           this text can be used for class montage later
%
%             if |aName| is set, matlab will also attempt to detect + label
%             a face inside the frame!
%
%
%    outputs: frame (the image that was snapped)
%
%    purpose: take a picture with a webcam = for matlab course, etc!
%
%        e.g: onlineWebcam();       % demo / don't save
%
%             onlineWebcam(true, 'denis') %

%% Pick the first webcam and make it available
% depending on whether this code is run on a PC or Mac, we need to do
% different things

if nargin < 2 || isempty(aName) || ~ischar(aName)
    % if user did not supply input argument, then assume we don't want to
    % save!
    aName = '';
end


if nargin < 1 || isempty(doSave)
    % if user did not supply input argument, then assume we don't want to
    % save!
    doSave = false;
end

try
    if ispc() || ismac()
        disp('this is a demo for ONLINE matlab / see uonWebcam() for desktop version')
        return
    end

    % get list of webcams
    wclist = webcamlist();
    if numel(wclist) > 0
        fprintf('using first webcam found... %s', wclist{1});
        obj = webcam(wclist{1});
    end
    
catch
    disp('(uonWebcam) looks like there are problems initializing the webcam')
    disp('            do you have a webcam & the image acq toolbox?')
    adapters = imaqhwinfo;
    if ~verLessThan('matlab', '8.4')
        disp('            Looks like you are running a Matlab version > 8.4!')
    end
    return
end


%% set up a preview window
% code from adapted from "help preview" !

preview(obj);


%% Pause
% wait until person presses a button to take a snapshot. You could also do
% this such that there is a particular time delay
disp('Waiting for a button press to take snap...')
pause()
frameRGB  = snapshot(obj);
disp('CLICK!')


%% Display image
% using |image()| to display the standard rgb image.
f2_ = figure('position',[50 50 400 300]);
imshow(rgb2gray(frameRGB));

% make the aspect ratio correct and switch axes/ticks off.
axis image
axis off

%% save some files
% if doSave flag is set and we are on a mac, then we can save out to
% filename!

if doSave
    % find out user name (by calling a unix command) / getenv('USER') also
    % works
    % [r uname] = unix('whoami');

    uname = getenv('USER');
    timestamp = datestr(now, 30); % the 30 means a particular format! look at the help for datestr

    filename = [uname '-' timestamp '.png'];
    imwrite(frameRGB, filename, 'PNG');
    fprintf('(!) wrote out file: %s\n', filename)
end

    % optionally, save out image for stitching
    if ~isempty(aName)

        % from mathworks example page - setup a face detector...
        faceDetector = vision.CascadeObjectDetector();

        % Detect feature points in the face region.
        bbox = detectFace(frameRGB, faceDetector);

        % init labelled image
        labelledImage = [];

        % check if we have a hit. if yes. label and save out.
        if ~isempty(bbox)
            % label and show
            labelledImage = labelFace(frameRGB, bbox, aName);
            imshow(labelledImage, 'InitialMagnification','fit');
            % and writen n image
            imwrite(labelledImage, [aName, '.png'], 'png');
        end

        % save a mat file
        save([aName, '.mat'], 'frameRGB', 'labelledImage');

    end


    %% clean up and close
    delete(obj) % remove imaq object
    disp('Click button to close all windows...')


end




%% helper function for detecting a / the face
function bbox = detectFace(imRGB, faceDetector)
    % detectFace - detect an image in face and return bbox

    bbox = step(faceDetector, imRGB);

end

%% helper function for labelling face
function im = labelFace(imRGB, bbox, label_str, useColor)
    % labelFace - detect an image in face and return labeled pic!

    if nargin < 4
        useColor = 1; % by default, use color
    end

    if size(bbox,1) > 1
        % pick the largest box, if there are more than 1 match!
        bbox = sortrows(bbox, [-3 -4]); % sort descending by w, then h!
        bbox = bbox(1,:);
    end

    if useColor == 1
        theIm = imRGB;
    else
        % black and white, but make more constrasty
        imGray = rgb2gray(imRGB);
        % adapthisteq is ok on gray scale images...
        theIm = adapthisteq(imGray,'ClipLimit',0.001);
    end

    % Draw the returned bounding box around the detected face.
    label_str = lower(label_str);

    % TODO - fontsize is hard coded. can we fix this?
    % im = insertObjectAnnotation(theIm, 'rectangle', bbox, label_str,'TextBoxOpacity', 0.9, 'Font', 'RobotoMono-Medium', 'FontSize', 72, 'Color','r');
    im = insertText(theIm, bbox(1,1:2), label_str,'BoxOpacity', 0.9, 'FontSize', 36, 'BoxColor','r', 'AnchorPoint','LeftBottom');

    im = insertShape(im, 'rectangle', bbox, 'Color', 'r', 'LineWidth',8);

end

