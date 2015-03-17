function imgs = mcsxReadFrames(mfile, ch, startIdx, endIdx)
% function imgs = mdfGetFrames(mfile, ch, startFrame, endFrame, imSize, pShift_calc)
%   mfile  : mcsx_data object
%   ch     : imaging ch 
%   startIdx: Start frame Index which you want to get
%   endIdx  : End frame Index which you want to get
%   
% Author: Takeuchi FR
% Created: Aug 2014
bufImg = mcsxReadFrame(mfile, ch, 1);
imSize = size(bufImg, 1);
imgs = zeros(imSize, imSize, length(startIdx:endIdx));
for i = startIdx:endIdx
	% disp(i)
	bufImg = mcsxReadFrame(mfile, ch, i);
	imgs(:,:,1+i-startIdx)=bufImg;
end

