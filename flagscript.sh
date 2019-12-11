#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( *.split )
	echo "##########STARTING ${dest}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
	foreach subdest ( 1934* )
		echo "##########STARTING ${dest} ${subdest}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
		pgflag vis=${subdest} stokes=xy,yx device=/xs  device3=./pgflag${subdest}/cps flagpar=10,1,1,3,5,3,20 command='=<beD' options=nodisp |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
                echo "Done pgflagging ${dest} ${subdest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
		uvflag vis=${subdest} "select=amplitude(150)" flagval=flag |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	        echo "Done uvflagging amp ${dest} ${subdest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
		uvflag vis=${subdest} edge=300 flagval=flag |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
                echo "Done uvflagging edges ${dest} ${subdest}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
		echo "##########FINISHED ${dest} ${subdest}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
	end
	echo "##########FINISHED ${dest}##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log
end
echo "##########ALL DONE##########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadflag.log



