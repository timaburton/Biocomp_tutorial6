#This file is for tutorial 6 assignment to sort by gender-yearsExperience combinations 
#usage: bash assignment6.sh

cat wages.csv| cut -d "," -f1,2 | tr , " " | sed 1d | sort -V -k1| uniq > GenderYears.txt 

#This is for part 2 that returns data to Stdout after running 

echo "Gender, yearsExperience, and wage of highest and lowest earner"
cat wages.csv | cut -d "," -f1,2,4 | sort -t "," -k3 -n | sed 1d| sed -n '1p;$p'

#How many females in the topw 10 earners 

echo "number of female top 10 earners"
cat wages.csv| sort -t "," -k4 -n -r| head | grep -w "female" | wc -l 

#the effect of graduating college on minimum wage of earners 

echo "effect of graduation on wage" 
echo "($(cat wages.csv| cut -d "," -f3,4 | sort -t "," -k1 -n| grep -E ^16 | cut -d "," -f2| sort -n| head -n 1)-$(cat wages.csv| cut -d "," -f3,4 | sort -t "," -k1 -n| grep -E ^12| cut -d "," -f2 | sort -n | head -n 1))"| bc 
