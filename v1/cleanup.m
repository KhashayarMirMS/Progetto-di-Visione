function cleanup()
    clear variables;
    clear global;
    close all;
    clc;
    
    addpath(genpath('MatlabFns'));
    
    system 'rm result.mp4';
    system 'rm outputFrames/*';
end