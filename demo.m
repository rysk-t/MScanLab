%% demo.m
close all; clear all
[fileName filePath] = uigetfile('*.MDF');
mdfFile = [filePath fileName];


%% Quick Summary Information and Averaged Image
Summary = mdfSummary(mdfFile, 256);
imshow(Summary.avg);
disp(Summary)
imwrite(Summary.avg, [mdfFile '.mean.tif'], 'tif')

%% Make Object & Read Information
close all;
mObj  = makeMCSXObj(mdfFile);
mInfo = mcsxInfo(mObj);

%% Frame Process
frames = mcsxReadFrames(mObj, 2, 1, 1000);

%% Analog (if you recorded analog signal)
% e.g. detect event trigger pulse
analog = mcsxAnalog(mObj, 1, 0.5, 'event');
figure
subplot(211)
plot(analog.vect, analog.sig, '-.');
subplot(212)
plot(analog.vect, analog.logi); hold on
plot(analog.vect(analog.evt), ones(length(analog.evt),1), 'rd');
