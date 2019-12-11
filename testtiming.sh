#!/bin/csh



#set START = $(date +%s)
for i in {1..1000000}
do
echo 1
done
set END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)
echo "It takes DIFF=$DIFF seconds to complete this task..."
