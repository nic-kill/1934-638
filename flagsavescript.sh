#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( *.uv.split )
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
	foreach subdest ( 1934* )	
		cp -r ${subdest}/flags ${subdest}/copyofflags 	
		echo "Done saving flags in ${dest}/${subdest}" |& tee -a miriadflagsave.log
	end
	echo "Done saving flags in ${dest}" |& tee -a miriadflagsave.log
end

echo "ALL DONE!" |& tee -a miriadsplit.log
