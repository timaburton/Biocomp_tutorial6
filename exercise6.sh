#!/bin/bash

##############
# activity 1 #
##############
#cat wages.csv | tail -n +2 | cut -d , -f 1,2 | tr , " " | sort -k 1,1 -k2n,2 -u > newWages.csv
# ^ used to get the file for activity 1

##############
# activity 2 #
##############
# usage: bash script.sh wages.csv

echo The highest earner:
cat $1 | cut -d , -f 1,2,4 | sort -t ',' -k 3n,3  -r | tail -n 1 

echo The lowest earner:
cat $1 | cut -d , -f 1,2,4 | sort -t ',' -k 3n,3  -r | sed -n '2p' 

echo The number of females in the top ten earners:
cat $1 | cut -d , -f 1,4 | sort -t ',' -k 2n,2  -r | tail -n 10 | grep -Ec female 

##############
# activity 3 #
##############
# usage: bash script.sh wages.csv
# REQUIREMENT: bc (command line calculator, used to handle floats)

# initialize variables
count12=0
count16=0
total12=0
total16=0

# sum the wage for 12 and 16 years while getting the count
while IFS=, read -r gender yearsExperience yearsSchool wage; do
	if [[ $yearsSchool == '12' ]] ; then
		count12=$(bc <<< $count12+$wage)
		total12=$(($total12+1))
	elif [[ $yearsSchool == '16' ]] ; then
		count16=$(bc <<< $count16+$wage)
		total16=$(($total16+1))
	fi
done < $1

# find the average wage for 12 and 16 years of school
avg12=$(bc <<< $count12/$total12)
avg16=$(bc <<< $count16/$total16)

# print results
if [ $avg12 -gt $avg16 ] ; then
	more_avg=$(bc <<< $avg12-$avg16)
	echo "12 years of school makes about \$$more_avg more than 16 years on average"
elif [ $avg16 -gt $avg12 ] ; then
	more_avg=$(bc <<< $avg16-$avg12)
	echo "16 years of school makes about \$$more_avg more than 12 years on average"
fi
