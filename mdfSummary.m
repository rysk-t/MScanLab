function mdf_summary = mdfSummary(mdffile, avgnframes)
% function mcs_summary = mcsSummary(mdffile, avgnframes)
%   mdffile   : .MDF-file name ( or path)
%   avgnframes: The number of frames for averaging image
%
% Ryosuke F Takeuchi 2015

disp('Loading MDF-File...')
mObj         = makeMCSXObj(mdffile);
openResult    = mObj.invoke('OpenMCSFile', mdffile);
mdf_summary   = mcsxInfo(mObj);

if openResult ==1
    disp([mcsfile ' succesfully loaded'])
end

if nargin > 1
    curCh = mcsxReadFrames(mObj, 1, 1, avgnframes);
		curCh = curCh - min(curCh(:));
    curCh = curCh./max(curCh(:));
    frames(:,:,1) = mean(curCh, 3);
    curCh = mcsxReadFrames(mObj, 2, 1, avgnframes);
    curCh = curCh./max(curCh(:));
    frames(:,:,2) = mean(curCh, 3);

    frames(:,:,3) = frames(:,:,1);

	if exist('adapthisteq') == 2
		for i = 1:3
			frames(:,:,i) = 2*(frames(:,:,i));
		end
	end
    mdf_summary.avg = frames;
end

clear mObj
