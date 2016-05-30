function [first, second, videoKeyFrame, x, y, keyFrame] = getMatchingPoints()
    global fileName folderName;
    
    global framerate;
    %ffmpegexec(sprintf('-i %s -r %g %s/%%d.png', fileName, framerate, folderName));
    
    keyFrameNumber = 1;
    keyFrame = imread(sprintf('%s/%d.png', folderName, keyFrameNumber));
    figure('Name', 'Key Frame'); imshow(keyFrame); title 'Select corners of the key frame:';
    [x, y] = ginput(4);
    close;
    
    videoKeyFrame = imread('frames/118.png');
    n = size(videoKeyFrame, 1);
    m = size(videoKeyFrame, 2);

    first = [1 1 1; 1 n 1; m 1 1; m n 1]';
    second = cat(2, x, y, ones(4, 1))';
end