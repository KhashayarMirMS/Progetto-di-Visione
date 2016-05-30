%% choose version
addpath(genpath('v1'));

%% clean up
cleanup();

global framerate;
framerate = 24.0181;

%% choose test
chooseTest('input2.mat');

%% build the video
global folderName;
for i = 1 : 529
    srcFrame = imread(sprintf('frames/%d.png', i));
    destFrame = imread(sprintf('%s/%d.png', folderName, i));
    
    [paddings, tform] = getFittingInfo(srcFrame, destFrame);
    result = fit(destFrame, srcFrame, tform, paddings);
    
    imwrite(result, sprintf('outputFrames/%d.png', i));
end

global numberOfFrames;
for i = 530 : numberOfFrames
    srcFrame = imread('frames/529.png');
    destFrame = imread(sprintf('%s/%d.png', folderName, i));
    
    [paddings, tform] = getFittingInfo(srcFrame, destFrame);
    result = fit(destFrame, srcFrame, tform, paddings);
    
    imwrite(result, sprintf('outputFrames/%d.png', i));
end

ffmpegexec(sprintf('-framerate %g -i outputFrames/%%d.png result.mp4', framerate));