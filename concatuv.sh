#!/bin/csh

cd /priv/myrtle1/gaskap/nickill/1934project/uvfiles

#uvcat vis=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/*/bootstrap/*1420.5.? out=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/allbootstrap1420merge.uv
UvCat vis=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/2019-05-27_1724.C3297.uv.split/bootstrap/*1420* out=/priv/myrtle1/gaskap/nickill/1934project/uvfiles/allbootstrap1420merge.uv

echo "ALL DONE!!!" |& tee -a /priv/myrtle1/gaskap/nickill/1934project/uvfiles/miriadconcat.log

