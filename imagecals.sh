#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( 2019-*.uv.split obs2018.uv.split )
	echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
	gpplt vis=1934-638.1419.5.2 device=gpplt1419.5.2.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	gpplt vis=1934-638.1419.5.6 device=gpplt1419.5.6.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	gpplt vis=1934-638.1420.5.4 device=gpplt1420.5.4.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	gpplt vis=1934-638.1420.5.4_flaggedHI device=gpplt1420.5.4flaggedHI.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	gpplt vis=1934-638.1420.5.6 device=gpplt1420.5.6.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	gpplt vis=1934-638.1420.5.6_flaggedHI device=gpplt1420.5.6flaggedHI.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	#
	uvplt vis=1934-638.1419.5.2 device=uvplt1419.5.2.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvplt vis=1934-638.1419.5.6 device=uvplt1419.5.6.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvplt vis=1934-638.1420.5.4 device=uvplt1420.5.4.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvplt vis=1934-638.1420.5.4_flaggedHI device=uvplt1420.5.4flaggedHI.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvplt vis=1934-638.1420.5.6 device=uvplt1420.5.6.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvplt vis=1934-638.1420.5.6_flaggedHI device=uvplt1420.5.6flaggedHI.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	#
	uvspec vis=1934-638.1419.5.2 interval=99999 options=nobase device=uvspec1419.5.2.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvspec vis=1934-638.1419.5.6 interval=99999 options=nobase device=uvspec1419.5.6.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvspec vis=1934-638.1420.5.4 interval=99999 options=nobase device=uvspec1420.5.4.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvspec vis=1934-638.1420.5.4_flaggedHI interval=99999 options=nobase device=uvspec1420.5.4flaggedHI.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvspec vis=1934-638.1420.5.6 interval=99999 options=nobase device=uvspec1420.5.6.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
	uvspec vis=1934-638.1420.5.6_flaggedHI interval=99999 options=nobase device=uvspec1420.5.6flaggedHI.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log

        uvplt vis=1934-638.1419.5.2/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1419.5.2.ps/cps nxy=1,1
        uvplt vis=1934-638.1419.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1419.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.4.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.4flaggedHI.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.6flaggedHI.ps/cps nxy=1,1

        uvplt vis=1934-638.1419.5.2/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1419.5.2.ps/cps nxy=1,1
        uvplt vis=1934-638.1419.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1419.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.4.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.4flaggedHI.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.6flaggedHI.ps/cps nxy=1,1

	#Plot interpolated cals
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated 
	gpplt vis=1934-638.1419.5.2 device=gpplt1419.5.2.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        gpplt vis=1934-638.1419.5.6 device=gpplt1419.5.6.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        gpplt vis=1934-638.1420.5.4 device=gpplt1420.5.4.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        gpplt vis=1934-638.1420.5.4_flaggedHI device=gpplt1420.5.4flaggedHI.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        gpplt vis=1934-638.1420.5.6 device=gpplt1420.5.6flaggedHI.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        gpplt vis=1934-638.1420.5.6_flaggedHI device=gpplt1420.5.6flaggedHI.ps/ps options=bandpass,dots |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        #
        uvplt vis=1934-638.1419.5.2 device=uvplt1419.5.2.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvplt vis=1934-638.1419.5.6 device=uvplt1419.5.6.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvplt vis=1934-638.1420.5.4 device=uvplt1420.5.4.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvplt vis=1934-638.1420.5.4_flaggedHI device=uvplt1420.5.4flaggedHI.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvplt vis=1934-638.1420.5.6 device=uvplt1420.5.6.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvplt vis=1934-638.1420.5.6_flaggedHI device=uvplt1420.5.6flaggedHI.ps/cps stokes=i,q,u,v axis=real,imag options=nobase |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        #
        uvspec vis=1934-638.1419.5.2 interval=99999 options=nobase device=uvspec1419.5.2.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvspec vis=1934-638.1419.5.6 interval=99999 options=nobase device=uvspec1419.5.6.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvspec vis=1934-638.1420.5.4 interval=99999 options=nobase device=uvspec1420.5.4.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvspec vis=1934-638.1420.5.4_flaggedHI interval=99999 options=nobase device=uvspec1420.5.4flaggedHI.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
        uvspec vis=1934-638.1420.5.6 interval=99999 options=nobase device=uvspec1420.5.6.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
       	uvspec vis=1934-638.1420.5.6_flaggedHI interval=99999 options=nobase device=uvspec1420.5.6flaggedHI.ps/cps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log

	uvplt vis=1934-638.1419.5.2/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1419.5.2.ps/cps nxy=1,1
        uvplt vis=1934-638.1419.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1419.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.4.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.4flaggedHI.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=real,imag options=nobase,avall,nocal,nopass device=realimagnocal1420.5.6flaggedHI.ps/cps nxy=1,1

        uvplt vis=1934-638.1419.5.2/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1419.5.2.ps/cps nxy=1,1
        uvplt vis=1934-638.1419.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1419.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.4/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.4.ps/cps nxy=1,1
	uvplt vis=1934-638.1420.5.4_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.4flaggedHI.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.6.ps/cps nxy=1,1
        uvplt vis=1934-638.1420.5.6_flaggedHI/ line=channel,1400,2300 stokes=xx,yy,xy,yx axis=phase,time options=nobase,avall,nocal,nopass device=phasetime1420.5.6flaggedHI.ps/cps nxy=1,1
	echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplots.log
end
