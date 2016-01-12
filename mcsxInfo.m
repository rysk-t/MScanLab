function mdfInfo = mcsxInfo(mObj)
% function mcsxinfo = GetInfoMCSFile(mObj)
%
%   mObj: mcsx_data object made by makeMCSXObj function
%
% Author: Takeuchi FR Mar 2014, Kazuhito Hakumoto


% Recording Status
mdfInfo.User = mObj.ReadParameter('Created by');
mdfInfo.Date = mObj.ReadParameter('Created on');

% Scales
tmp = mObj.ReadParameter('Microns per Pixel');
mdfInfo.um_per_pixel = str2double(tmp(1:end-2));

% Lense
mdfInfo.micronsPix = mObj.ReadParameter('Microns per Pixel');
mdfInfo.Objective = mObj.ReadParameter('Objective');

% Laser
mdfInfo.LaserPow   = mObj.ReadParameter('Laser intensity');
mdfInfo.LaserWleng = str2double(mObj.ReadParameter('Laser Wavelength (nm)'));

% Imaging Position
tmp = mObj.ReadParameter('X Position');
mdfInfo.xPosition = str2double(tmp(1:end-2));
tmp = mObj.ReadParameter('Y Position');
mdfInfo.yPosition = str2double(tmp(1:end-2));
tmp = mObj.ReadParameter('Z Position');
mdfInfo.zPosition = str2double(tmp(1:end-2));
mdfInfo.timebase = mObj.ReadParameter('Timebase');
mdfInfo.imagingTrigger = mObj.ReadParameter('Imaging Trigger');

% Frame Info
mdfInfo.NofFrames   = str2double(mObj.ReadParameter('Frame Count'));
mdfInfo.frameheight = str2double(mObj.ReadParameter('Frame Height'));
mdfInfo.framewidth  = str2double(mObj.ReadParameter('Frame Width'));
mdfInfo.frameBitDep = mObj.ReadParameter('Frame Bit Depth');

tmp = mObj.ReadParameter('Magnification');
mdfInfo.magnification = str2double(tmp(1:end-1));
tmp = mObj.ReadParameter('Frame Duration (s)');
mdfInfo.framerate = str2double(tmp(1:end-1));

% Analog
mdfInfo.AnalogFreq = ...
    mObj.ReadParameter(['Analog Acquisition Frequency (Hz)']);
mdfInfo.AnalogRes = ...
    mObj.ReadParameter('Analog resolution');

mdfInfo.AnalogRate = str2double(mdfInfo.AnalogFreq(1:end-2));

mdfInfo = orderfields(mdfInfo);
