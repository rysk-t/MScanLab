%% demo.m
close all
[fileName filePath] = uigetfile('*.MDF');
mdfFile = [filePath fileName];


%% Quick Summary Information and Averaged Image
Summary = mdfSummary(mdfFile, 100);
imshow(Summary.avg);
disp(Summary)

%% BASIC USAGE 1: Make Object & Read Information
close all; 
f = figure;
mObj  = makeMCSXObj(mdfFile, f);
mInfo = mcsxInfo(mObj);

%% Frame Process
frames = mcsxReadFrames(mObj, 2, 1, 256);

%% Analog (if you recorded analog signal)
analog = mcsxAnalog(mObj, 0, 0.5);
figure;
plot(linspace(0, analog.recordLeng, analog.leng), analog.sig);