function [paddings, tform] = getFittingInfo(src, dest)
    global firstTime globalPaddings globalTForm;

    if isempty(firstTime)
        firstTime = true;
        
        [first, second, videoKeyFrame, x, y, keyFrame] = getMatchingPoints();
        h = homography2d(first, second);
        globalTForm = maketform('projective', h'); %#ok
        I = imtransform(videoKeyFrame, globalTForm); %#ok

        xBefore = min(y);
        xAfter = size(keyFrame, 1) - xBefore - size(I, 1);
        yBefore = min(x);
        yAfter = size(keyFrame, 2) - yBefore - size(I, 2);
        globalPaddings = round([xBefore, xAfter; yBefore, yAfter]);
    end
    
    paddings = globalPaddings;
    tform = globalTForm;
end