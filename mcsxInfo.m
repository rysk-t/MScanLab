function mdfInfo = mcsxfInfo(mfile)
% function mcsinfo = GetInfoMCSFile(mfile)
% 
%   mfile: mcsx_data object
%
% Author: Takeuchi FR Mar 2014


% Recording Status
mdfInfo.User = invoke(mfile, 'ReadParameter', 'Created by');
mdfInfo.Date = invoke(mfile, 'ReadParameter', 'Created on');

% Scales
tmp = invoke(mfile, 'ReadParameter', 'Microns per Pixel');
mdfInfo.um_per_pixel = str2double(tmp(1:end-2));

% Lense
mdfInfo.micronsPix = invoke(mfile, 'ReadParameter', 'Microns per Pixel');
mdfInfo.Objective = invoke(mfile, 'ReadParameter', 'Objective');


% Imaging Position
tmp = invoke(mfile, 'ReadParameter', 'X Position');
mdfInfo.xPosition = str2double(tmp(1:end-2));
tmp = invoke(mfile, 'ReadParameter', 'Y Position');
mdfInfo.yPosition = str2double(tmp(1:end-2));
tmp = invoke(mfile, 'ReadParameter', 'Z Position');
mdfInfo.zPosition = str2double(tmp(1:end-2));
mdfInfo.timebase = invoke(mfile, 'ReadParameter', 'Timebase');
mdfInfo.imagingTrigger = invoke(mfile, 'ReadParameter', 'Imaging Trigger');

% Frame Info
mdfInfo.NofFrames = str2double(invoke(mfile, 'ReadParameter', 'Frame Count'));
mdfInfo.frameheight = str2double(invoke(mfile, 'ReadParameter', 'Frame Height'));
mdfInfo.framewidth = str2double(invoke(mfile, 'ReadParameter', 'Frame Width'));

tmp = (invoke(mfile, 'ReadParameter', 'Magnification'));
mdfInfo.magnification = str2double(tmp(1:end-1));
tmp = invoke(mfile, 'ReadParameter', 'Frame Duration (s)');
mdfInfo.framerate = str2double(tmp(1:end-1));

% Analog
mdfInfo.AnalogFreq = ...
    invoke(mfile, 'ReadParameter', ['Analog Acquisition Frequency (Hz)']);
mdfInfo.AnalogRes = ...
    invoke(mfile, 'ReadParameter', 'Analog resolution');

mdfInfo.AnalogRate = str2double(mdfInfo.AnalogFreq(1:end-2));

mdfInfo = orderfields(mdfInfo);