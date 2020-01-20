addpath("../Apolo/Matlab/")

%%
apoloUpdate()
ret = apoloGetLaserLandMarks('LMS100','World 1');

disp(ret)