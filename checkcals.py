from pathlib import Path
import numpy as np

#where are the root files
directory=Path('/priv/myrtle1/gaskap/nickill/1934project/uvfiles/')

toplevel='*.uv.split'
sublevel='bootstrap'

#top level directories to check
uvlist=list(directory.glob(toplevel))

callist=[]
for i in uvlist:
	callist=np.append(callist,uvlist[i].joinpath(sublevel))


#subdirectory to look for
#calfiles=list(directory.glob(uvlist.joinpath(sublevel)))

#list of failures
fails=[elem for elem in uvlist if elem.joinpath(sublevel) not in calfiles ]

print(fails)
print(len(fails), 'fails in', len(uvlist))



