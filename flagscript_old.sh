#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( *.split )
	echo "STARTING ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
	#pgflagging
	pgflag vis=1934-638.1419.5.2 stokes=xy,yx device=/xs  device3=./pgflag1419.5.2.ps/cps flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
 	echo "Done pgflagging ${dest} 1419.5.2" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	pgflag vis=1934-638.1419.5.6 stokes=xy,yx device=/xs device3=./pgflag1419.5.6.ps/cps flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
 	echo "Done pgflagging ${dest} 1419.5.6" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	pgflag vis=1934-638.1420.5.4 stokes=xy,yx device=/xs device3=./pgflag1420.5.4.ps/cps flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        echo "Done pgflagging ${dest} 1420.5.4" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	pgflag vis=1934-638.1420.5.6 stokes=xy,yx device=/xs device3=./pgflag1420.5.6.ps/cps flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	echo "Done pgflagging ${dest} 1420.5.6" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	#ampltiude flagging
	uvflag vis=1934-638.1419.5.2 "select=amplitude(150)" stokes=xy,yx,xx,yy flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        echo "Done uvflagging ${dest} 1419.5.2" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        uvflag vis=1934-638.1419.5.6 "select=amplitude(150)" stokes=xy,yx,xx,yy flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        echo "Done uvflagging ${dest} 1419.5.6" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        uvflag vis=1934-638.1420.5.4 "select=amplitude(150)" stokes=xy,yx,xx,yy flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        echo "Done uvflagging ${dest} 1420.5.4" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        uvflag vis=1934-638.1420.5.6 "select=amplitude(150)" stokes=xy,yx,xx,yy flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
        echo "Done uvflagging ${dest} 1420.5.6" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	echo "FINISHED ${dest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
end
echo "ALL DONE!!!" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log






