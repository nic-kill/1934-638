#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

foreach dest ( *.uv )
	uvsplit vis=${dest} "select=source(1934-638)"
	echo "Done splitting ${dest}" |& tee -a miriadsplit.log
	rm -rf 1934-638.1611.5.3
	rm -rf 1934-638.1664.5.4
	rm -rf 1934-638.1666.5.7
	rm -rf 1934-638.1719.5.8
	rm -rf 1934-638.2100.1
	rm -rf 1934-638.2100.5
	mkdir /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}.split
	mv 1934-638* /priv/myrtle1/gaskap/nickill/1934project/uvfiles/${dest}.split
	echo "Done moving files to ${dest}.split" |& tee -a miriadsplit.log
end

echo "ALL DONE!" |& tee -a miriadsplit.log
