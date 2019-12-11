#!/usr/bin/env python
import glob
import os
import subprocess,shlex,shutil
import sys
# Script for converting uvfits to miriad and then performing uvlin

files = glob.glob('*.uvfits')
filebase = 'scienceData_SB8957_SMC1-1_M344-06'
interleave = sys.argv[1]
print(interleave)
# Check that the miriad file exists for every uvfits file
for beam in range(0,36):
#for file in files:
    file = '%s%s.beam%02d_SL.uvfits' % (filebase,interleave,beam)
    print(file)
    mirfile = file.split('.uvfits')[0]+'.mir'
# If not load the file into miriad
    if not os.path.exists(mirfile): 
        cmd = 'fits in=%s out=%s op=uvin' %(file,mirfile )
        print(cmd)
        args =shlex.split(cmd)
        p = subprocess.Popen(args,stdout=subprocess.PIPE)
        p.wait()

for beam in range(0,36):
    mirfile = '%s%s.beam%02d_SL.mir' % (filebase,interleave,beam)
    namestr = 'SMC_'
    newfile = mirfile.replace(filebase,namestr)
    tempfile = newfile.replace("beam","b")
    uvlinfile = tempfile.split('.mir')[0]+'.uvlin'
# First let's flag the auto correlations
    if os.path.exists(mirfile): 
        cmd='uvflag vis=%s select=auto flagval=flag'%mirfile
        print(cmd)
        args =shlex.split(cmd)
        p = subprocess.Popen(args,stdout=subprocess.PIPE)
        p.wait()
# Now flag the high amplitude stuff
        cmd='uvflag vis=%s select=amp(100,1e7) flagval=flag'%mirfile
        print(cmd)
        args =shlex.split(cmd)
        p = subprocess.Popen(args,stdout=subprocess.PIPE)
        p.wait()
# Now do the uvlin step
        cmd=' uvlin vis=%s chans=100,500,1980,2100 out=%s' %(mirfile,uvlinfile)
        print(cmd)
        args =shlex.split(cmd)
        p = subprocess.Popen(args,stdout=subprocess.PIPE)
        p.wait()
    if os.path.exists(uvlinfile):
        cmd='puthd in=%s/restfreq value=1.42040575' % uvlinfile
        print(cmd)
        args =shlex.split(cmd)
        p = subprocess.Popen(args,stdout=subprocess.PIPE)
        p.wait()

