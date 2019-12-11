#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

date |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log

set gpcalint = (1)
set gpcalintgap = (0.5)
set gpcalnfbin = (1)

#for months april and may - flagging channels varies with time of year
foreach dest ( 2016-04*.uv.split 2016-05*.uv.split )
	echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
	pwd |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#remove preivous calibrations
	rm -rf interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	rm -rf bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#start cal
	mkdir interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mkdir bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#move data into the bootstrap directory
	cp -r 1934* bootstrap/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
	#make copy of the 1420 for flagging
	cp -r 1934-638.1420.5.6 1934-638.1420.5.6_flaggedHI |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
 	#flag the HI line on the new copy
	uvflag vis=1934-638.1420.5.6_flaggedHI line=channel,230,3000,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#copy HI flagged 1420 and unflagged in HI 1419 into interpolated folder for calibration
	cp -r 1934-638.1420.5.6_flaggedHI ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	cp -r 1934-638.1419.5.2 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	cp -r 1934-638.1419.5.6 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#Compute sols through interpolation method
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated 
	#flag HI line in 1419, this is only done for the interpolation method
	uvflag vis=1934-638.1419.5.2 line=channel,200,970,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	uvflag vis=1934-638.1419.5.6 line=channel,200,970,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#calibrate interpolated method
	mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mfcal vis=1934-638.1420.5.6_flaggedHI/ line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	#now do the bootstrapping
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap 
	mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	cp -rf /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated/1934-638.1420.5.6_flaggedHI ./ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	gpcopy vis=1934-638.1420.5.6_flaggedHI/ out=1934-638.1420.5.6/ options=nopass,nopol |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	cp -r 1934-638.1419.5.2/bandpass 1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
end

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

#flagging for august
foreach dest ( 2016-08*.uv.split )
        echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest} 
	rm -rf interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        rm -rf bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mkdir interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mkdir bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #move data into the bootstrap directory
        cp -r 1934* bootstrap/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log 
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        #make copy of the 1420 for flagging
        cp -r 1934-638.1420.5.6 1934-638.1420.5.6_flaggedHI |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #flag the HI line on the new copy
        uvflag vis=1934-638.1420.5.6_flaggedHI line=channel,200,3370,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #copy HI flagged 1420 and unflagged in HI 1419 into interpolated folder for calibration
        cp -r 1934-638.1420.5.6_flaggedHI ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.6 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #Compute sols through interpolation method
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated
        #flag HI line in 1419, this is only done for the interpolation method
        uvflag vis=1934-638.1419.5.2 line=channel,220,1350,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        uvflag vis=1934-638.1419.5.6 line=channel,220,1350,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #calibrate interpolated method
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.6_flaggedHI/ line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #now do the bootstrapping
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.6_flaggedHI line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcopy vis=1934-638.1420.5.6_flaggedHI/ out=1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2/bandpass 1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
end


cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

#flagging for november
foreach dest ( 2016-11*.uv.split )
        echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
        rm -rf interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        rm -rf bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mkdir interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log 
        mkdir bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #move data into the bootstrap directory
        cp -r 1934* bootstrap/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap 
        #make copy of the 1420 for flagging
        cp -r 1934-638.1420.5.6 1934-638.1420.5.6_flaggedHI |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #flag the HI line on the new copy
        uvflag vis=1934-638.1420.5.6_flaggedHI line=channel,200,3390,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #copy HI flagged 1420 and unflagged in HI 1419 into interpolated folder for calibration
        cp -r 1934-638.1420.5.6_flaggedHI ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.6 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #Compute sols through interpolation method
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated 
        #flag HI line in 1419, this is only done for the interpolation method
        uvflag vis=1934-638.1419.5.2 line=channel,250,1300,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        uvflag vis=1934-638.1419.5.6 line=channel,250,1300,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #calibrate interpolated method
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.6_flaggedHI/ line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #now do the bootstrapping
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.6_flaggedHI line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcopy vis=1934-638.1420.5.6_flaggedHI/ out=1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2/bandpass 1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
end

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

#flagging for feb
foreach dest ( 2017-02*.uv.split )
        echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest} 
        rm -rf interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        rm -rf bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mkdir interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mkdir bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #move data into the bootstrap directory
        cp -r 1934* bootstrap/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        #make copy of the 1420 for flagging
        cp -r 1934-638.1420.5.6 1934-638.1420.5.6_flaggedHI |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #flag the HI line on the new copy
        uvflag vis=1934-638.1420.5.6_flaggedHI line=channel,300,2990,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #copy HI flagged 1420 and unflagged in HI 1419 into interpolated folder for calibration
        cp -r 1934-638.1420.5.6_flaggedHI ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.6 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #Compute sols through interpolation method
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated
        #flag HI line in 1419, this is only done for the interpolation method
        uvflag vis=1934-638.1419.5.2 line=channel,200,1050,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        uvflag vis=1934-638.1419.5.6 line=channel,200,1050,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #calibrate interpolated method
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.6_flaggedHI/ line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
       	gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #now do the bootstrapping
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1419.5.6 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.6_flaggedHI line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
       	gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.6 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
       	gpcal vis=1934-638.1420.5.6_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcopy vis=1934-638.1420.5.6_flaggedHI/ out=1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2/bandpass 1934-638.1420.5.6/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
end

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

#flagging for 2019
foreach dest ( 2019*.uv.split )
        echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
        rm -rf interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        rm -rf bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
	mkdir interpolated |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mkdir bootstrap |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #move data into the bootstrap directory
        cp -r 1934* bootstrap/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        #make copy of the 1420 for flagging
        cp -r 1934-638.1420.5.4 1934-638.1420.5.4_flaggedHI |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #flag the HI line on the new copy
        uvflag vis=1934-638.1420.5.4_flaggedHI line=channel,200,3080,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #copy HI flagged 1420 and unflagged in HI 1419 into interpolated folder for calibration
        cp -r 1934-638.1420.5.4_flaggedHI ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2 ../interpolated/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #Compute sols through interpolation method
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated 
        #flag HI line in 1419, this is only done for the interpolation method
        uvflag vis=1934-638.1419.5.2 line=channel,260,970,1,1 flagval=f |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #calibrate interpolated method
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.4_flaggedHI/ line=channel,5200,400,1,1 refant=3 interval=5 options=interpolate |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
       	gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.4_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        #now do the bootstrapping
        cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
        mfcal vis=1934-638.1419.5.2 line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        mfcal vis=1934-638.1420.5.4_flaggedHI line=channel,5200,400,1,1 refant=3 interval=5 |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1419.5.2 refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcal vis=1934-638.1420.5.4_flaggedHI/ refant=3 interval=$gpcalint options=xyvary nfbin=$gpcalnfbin |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        gpcopy vis=1934-638.1420.5.4_flaggedHI/ out=1934-638.1420.5.4/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        cp -r 1934-638.1419.5.2/bandpass 1934-638.1420.5.4/ |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
        echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log
end

echo "EVERYTHING IS DONE" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcal.log


