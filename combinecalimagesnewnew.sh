#!/bin/csh

date |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log
cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/
rm /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/*/*.ps

foreach dest ( bootstrap interpolated )
        foreach plot ( bandpass realimag uvspec realimagnocal timephasenocal timeampnocal )
                foreach line ( 1934-638.1419.5.2 1934-638.1419.5.6 1934-638.1420.5.4 1934-638.1420.5.4_flaggedHI 1934-638.1420.5.6 1934-638.1420.5.6_flaggedHI )
			echo "STARTING ${dest} ${plot}${line}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log
                	gs -sDEVICE=pswrite \
                   	   -dNOPAUSE -dBATCH -dSAFER \
                   	   -sOutputFile=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/${dest}/${plot}${line}.ps \
                   	   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/*/${dest}/${plot}${line}.ps \
                	echo "FINISHED ${dest} ${plot}${line}" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log
		end
        end
end
date |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log
echo "ALL DONE" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log
