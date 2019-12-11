#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( *.uv.split )
	cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}
	foreach subdest ( 1934* )	
		cp -r ${subdest}/copyofflags ${subdest}/flags |& tee -a miriadflagrestore.log
		echo "Done restoring flags in ${dest}/${subdest}" |& tee -a miriadflagrestore.log
	end
	echo "Done restoring flags in ${dest}" |& tee -a miriadflagrestore.log
end

echo "ALL DONE!" |& tee -a miriadsplit.log
