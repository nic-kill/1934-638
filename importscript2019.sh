#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/2019/
foreach dest ( *.C3297 )
	atlod in=${dest} out=${dest}.uv options=birdie,xycorr,reweight,noauto |& tee -a miriadimport.log
	echo "Done ${dest}" |& tee -a miriadimport.log
end






