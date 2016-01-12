function img = mcsxReadFrame(mObj, ch, frameIdx)
% function img = MCS_ReadFrame(mfile, ch, frameIdx)
%
% This function invoke ReadFrame class from MCSX.
% USE mcsxReadFrames for 3D-data

img = double(invoke(mObj, 'ReadFrame', ch, frameIdx))';
