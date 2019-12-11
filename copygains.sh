#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( 2019*.uv.split )
	echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadgpcopy.log
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
	gpcopy vis=../interpolated/1934-638.1420.5.4_flaggedHI/ out=1934-638.1420.5.4/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadgpcopy.log
	echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadgpcopy.log
end

echo "EVERYTHING IS DONE!!!" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadgpcopy.log


