function [mObj, fileName, filePath] = makeMCSXObj(mdfFile)
% mObj = makeMCSXObj(mdfFileName);
%     or [mObj, fileName, filePath] = makeMCSXObj(); % open by gui dialog
% This code provide MCSX.COM object
%  e.g. mObj = makeMCSXObj('pollen.MDF');
%
% Ryosuke F Takeuchi 2015/06, K_hakumoto 2015/11

if nargin == 0
    [fileName filePath] = uigetfile('*.MDF');
    mdfFile = [filePath fileName];
else
    [filePath, fileName, fileExt] = fileparts(mdfFile);
    fileName = [fileName, fileExt];
end

f = figure;
set(f, 'OuterPosition', [0 0 50 50])
mObj = actxcontrol('MCSX.Data', [0, 0, 10, 10], f);
openResult  = mObj.invoke('OpenMCSFile', mdfFile);
