#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

date |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log

#remove previous plots
rm *.uv.split/*/*.ps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log

#include calibrated directories
foreach dest ( 2016*.uv.split 2017-02*.uv.split 2019-*.uv.split )
	echo "##########STARTING ${dest}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	#plot for bootstrapping
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
	foreach subdestboot ( 1934* )
		echo "##########STARTING bootstrap ${dest} ${subdestboot}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
		gpplt vis=${subdestboot} device=bandpass${subdestboot}.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
		uvplt vis=${subdestboot} device=realimag${subdestboot}.ps/cps stokes=xx,yy,xy,yx axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
		uvspec vis=${subdestboot} device=uvspec${subdestboot}.ps/cps interval=999999 options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        	uvplt vis=${subdestboot} device=realimagnocal${subdestboot}.ps/cps line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass nxy=1,1 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        	uvplt vis=${subdestboot} device=timephasenocal${subdestboot}.ps/cps line=channel,1400,2300 stokes=xx,yy,xy,yx axis=time,phase options=nobase,nocal,nopass nxy=1,1 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
		uvplt vis=${subdestboot} device=timeampnocal${subdestboot}.ps/cps line=channel,1400,2300 stokes=xx,yy,xy,yx axis=time,amplitude options=nobase,nocal,nopass nxy=1,1 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
		echo "##########FINISHED bootstrap ${dest} ${subdestboot}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	end
	#Plot interpolated cals
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated 
	foreach subdestint ( 1934* )
		echo "##########STARTING interpolated ${dest} ${subdestint}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
               	gpplt vis=${subdestint} device=bandpass${subdestint}.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
               	uvplt vis=${subdestint} device=realimag${subdestint}.ps/cps stokes=xx,yy,xy,yx axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
               	uvspec vis=${subdestint} device=uvspec${subdestint}.ps/cps interval=999999 options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
               	uvplt vis=${subdestint} device=realimagnocal${subdestint}.ps/cps line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass nxy=1,1 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles$
               	uvplt vis=${subdestint} device=timephasenocal${subdestint}.ps/cps line=channel,1400,2300 stokes=xx,yy,xy,yx axis=time,phase options=nobase,nocal,nopass nxy=1,1 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/mir$
               	uvplt vis=${subdestint} device=timeampnocal${subdestint}.ps/cps line=channel,1400,2300 stokes=xx,yy,xy,yx axis=time,amplitude options=nobase,nocal,nopass nxy=1,1 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/m$
       		echo "##########FINISHED interpolated ${dest} ${subdestint}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	end
	echo "##########FINISHED ${dest}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
end
echo "##########ALL DONE##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log

date |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
