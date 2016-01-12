function imgs = mcsxReadFrames(mObj, ch, startIdx, endIdx)
% function imgs = mcsxReadFrames(mObj, ch, startIdx, endIdx)
%
%   mObj  : mcsx_data object
%   ch     : imaging ch
%   startIdx: Start frame Index which you want to get
%   endIdx  : End frame Index which you want to get
%
%   See also: mcsxReadFrame
%
% Ryosuke F Takeuchi 2014/08

framesNum = length(startIdx:endIdx);
h = waitbar(0,'Buffering Frames...');
bufImg = mcsxReadFrame(mObj, ch, 1);
imSize = size(bufImg, 1);
imgs = zeros(imSize, imSize, framesNum);

for i = startIdx:endIdx
	% disp(i)
	curIdx = (i-startIdx)/framesNum;
	waitbar(curIdx, h, ...
		sprintf(['Loading:' '%d /' num2str(endIdx-startIdx+1)], i-startIdx));
	bufImg = mcsxReadFrame(mObj, ch, i);
	imgs(:,:,1+i-startIdx)=bufImg;
end
delete(h)
