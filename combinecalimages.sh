#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles/

#foreach dest ( bootstrap interpolated )
#	foreach line ( gpplt1419.5.2.ps gpplt1419.5.6.ps gpplt1420.5.4.ps gpplt1420.5.4flaggedHI.ps gpplt1420.5.6.ps gpplt1420.5.6flaggedHI.ps uvplt1419.5.2.ps uvplt1419.5.6.ps uvplt1420.5.4.ps uvplt1420.5.4flaggedHI.ps uvplt1420.5.6.ps uvplt1420.5.6flaggedHI.ps uvspec1419.5.2.ps uvspec1419.5.6.ps uvspec1420.5.4.ps uvspec1420.5.4flaggedHI.ps uvspec1420.5.6.ps uvspec1420.5.6flaggedHI.ps  ) 
#		echo "STARTING ${dest} ${line}"
#		gs -sDEVICE=pswrite \
#   		   -dNOPAUSE -dBATCH -dSAFER \
#   		   -sOutputFile=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/${dest}/${line}.ps \
#   		   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/*/${dest}/${line} \
#		echo "FINISHED ${dest} ${line}"
#	end
#end
##echo "ALL DONE!!" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log

#foreach line ( phasetime1419.5.2.ps realimag1419.5.2.ps realimagnocal1419.5.2.ps phasetime1420.5.6flaggedHI.ps realimag1420.5.6flaggedHI.ps realimagnocal1420.5.6flaggedHI.ps phasetime1420.5.6.ps realimag1420.5.6.ps realimagnocal1420.5.6.ps )


foreach dest ( bootstrap interpolated )
        foreach line ( timephasenocal1934-638.1420.5.4.ps realimag1419.5.6.ps realimagnocal1419.5.6.ps phasetime1420.5.4.ps realimag1420.5.4.ps realimagnocal1420.5.4.ps phasetime1420.5.4flaggedHI.ps realimag1420.5.4flaggedHI.ps realimagnocal1420.5.4flaggedHI.ps )
                echo "STARTING ${dest} ${line}"
                gs -sDEVICE=pswrite \
                   -dNOPAUSE -dBATCH -dSAFER \
                   -sOutputFile=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/${dest}/${line}.ps \
                   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/*/${dest}/${line} \
                echo "FINISHED ${dest} ${line}"
        end
end
echo "ALL DONE!!" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/combinecalplots.log


#This one below works correctly
#gs -sDEVICE=pswrite \
#   -dNOPAUSE -dBATCH -dSAFER \
#   -sOutputFile=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/bootstrap/testcombined.ps \
#   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/test/test1/gpplt1420.5.6flaggedHI.ps \
#   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/test/test2/gpplt1420.5.6flaggedHI.ps \
#   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/test/test2/uvplt1419.5.2.ps \

#so does this
#gs -sDEVICE=pswrite \
#   -dNOPAUSE -dBATCH -dSAFER \
#   -sOutputFile=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/combinedimages/bootstrap/testcombined2.ps \
#   /priv/myrtle1/gaskap/nickill/1934project/uvfiles/*/bootstrap/uvplt1419.5.2.ps \
