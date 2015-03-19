function mcs_summary = mdfSummary(mdffile, avgnframes)
% function mcs_summary = mcsSummary(mdffile, avgnframes)
%   mdffile   : .MDF-file name ( or path)
%   avgnframes: The number of frames for averaging image
%
% Ryosuke F Takeuchi 2015

disp('Loading MDF-File...')
f             = figure(1000); 
mfile         = actxcontrol('MCSX.Data', [0, 0, 500, 500], f);
openResult    = mfile.invoke('OpenMCSFile', mdffile);
mcs_summary   = mcsxInfo(mfile);

if openResult ==1
    disp([mcsfile ' succesfully loaded'])        
end

if nargin > 1
    curCh = Get_specFrames(mfile, 1, 1, avgnframes, mcs_summary.frameheight, false);
    curCh = curCh./max(curCh(:));
    frames(:,:,1) = mean(curCh, 3);
    curCh = Get_specFrames(mfile, 2, 1, avgnframes, mcs_summary.frameheight, false);
    curCh = curCh./max(curCh(:));
    frames(:,:,2) = mean(curCh, 3);

    frames(:,:,3) = frames(:,:,1);
	
	if exist('adapthisteq') == 2 
		for i = 1:3
			frames(:,:,i) = adapthisteq(frames(:,:,i));
		end
	end
	
	
    mcs_summary.avg = frames;
	
	
end
    
close(1000)