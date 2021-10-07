#this is a script for tutorial 6 homework 
#usage: bash tutorial6.sh

#1
cat wages.csv | cut -d , -f 1,2 | grep -E "female|male" | sort -k1,1 -k2,2n -t',' | uniq > genderyears.csv 

#2
#a 
echo Gender, Years Experience, Wage for Highest Earner
cat wages.csv | cut -d , -f 1,2,4 | grep -E "male|female" | sort -k3,3n -t',' | tail -n 1  

#b
echo Gender, Years Experience, Wage for Lowest Earner
cat wages.csv | cut -d , -f 1,2,4 | grep -E "male|female" | sort -k3,3n -t',' | head -n 1

#c
echo Number of Females in Top Ten Wage Earners
cat wages.csv | cut -d , -f 1,2,4 | grep -E "male|female" | sort -k3,3n -t',' | tail -n 10 | grep -c "female"

#3
twelve=$(cat wages.csv | cut -d , -f 3,4 | grep -w "^12" | sort -k2,2n -t',' | head -n 1 | cut -d , -f 2)
sixteen=$(cat wages.csv | cut -d , -f 3,4 | grep -w "^16" | sort -k2,2n -t',' | head -n 1 | cut -d , -f 2)
echo Effect of Graduating College on Minimum Wage for Earners 
echo "$sixteen - $twelve" | bc

