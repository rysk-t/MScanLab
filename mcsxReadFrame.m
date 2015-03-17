function img = MCS_ReadFrame(mfile, ch, frameIdx)
% function img = MCS_ReadFrame(mfile, ch, frameIdx)

img = double(invoke(mfile, 'ReadFrame', ch, frameIdx))';
