#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles
#rm *.uv.split/*/*.ps |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log

foreach dest ( 2016*.uv.split 2017-02*.uv.split 2019-*.uv.split )
	echo "#######STARTING ${dest}#########" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
	#plot for bootstrapping
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap
	foreach subdestboot ( 1934* )
		echo "#######STARTING bootstrap ${dest} ${subdestboot}#######" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
		cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/bootstrap/${subdestboot}
		pwd |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
		echo "#######FINISHED bootstrap ${dest} ${subdestboot}#######" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
	end
	#Plot interpolated cals
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated 
	foreach subdestint ( 1934* )
		echo "#######STARTING interpolated ${dest} ${subdestint}#######" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
		cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}/interpolated/${subdestboot}
               	pwd |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
       		echo "#######FINISHED interpolated ${dest} ${subdestint}#######" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
	end
	echo "#####FINISHED ${dest}######" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
end
echo "#######ALL DONE######" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadcalplotstest.log
