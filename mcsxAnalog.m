function [Analog] = mcsxAnalog(mfile, ch, thre, opt)
% function [Analog] = GetMCSAnalog(mfile, ch, thre)
%
%  mfile: mcsx file object
%  ch   : analog ch
%  thre : Threshold Value for exporting signal as digital
% 
%
% Author: Ryosuke F Takeuchi Mar 2014
%
% See also: mdfInfo.m

mdfStruct = mcsxInfo(mfile);
rate = str2double(mdfStruct.AnalogFreq(1:end-2));

% Iteration 
% Initial i value is important for faster process.
% This function estimaging analog signal length from imaging rate
% and the number of frame.

i = str2double(mdfStruct.AnalogFreq(1:end-2))*...
	mdfStruct.framerate*mdfStruct.NofFrames-1000;

disp(['started from ' num2str(i)])
while true
    sig = invoke(mfile, 'ReadAnalog', ch, i, i-10);
    % if i > sampleSize, break
    if isnan(sig)
        analogLength = i-1;
        break;
    end    
    clear sig;
    i = i+1;
end

Analog.rate = mdfStruct.AnalogFreq;
Analog.sig = invoke(mfile, 'ReadAnalog', ch, analogLength, 0);
Analog.leng = analogLength;
Analog.recordLeng   = Analog.leng/(rate); % sec;


if nargin > 2
    threValue         = (max(Analog.sig)+min(Analog.sig))/(1/thre);
    Analog.logi = Analog.sig > threValue;
    Analog.logi = correctAnalogs(Analog.logi);    
end

if nargin > 3
	if strcmp(opt, 'event')
		% if analog ch getting event trigger
		Analog.evt = double([Analog.logi 0]) - double([0 Analog.logi]);
		Analog.evt(Analog.evt < 0) = 0;
		Analog.evt = logical(Analog.evt);
		Analog.evt = find(Analog.evt(1:end-1));
	end
end
	
Analog.vect = linspace(0, Analog.recordLeng, Analog.leng);
orderfields(Analog)


end

function correctedSig = correctAnalogs(sig)
sigbuf = [0 sig];
sig = [sig 0];
correctedSig = logical(sig+sigbuf);
correctedSig = correctedSig(1:end-1);
end