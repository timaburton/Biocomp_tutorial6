#This shell script alters csv files that contain the following rows: Gender, Years Experience, Years School, Wage
#Usage: bash wageinfo.sh filename

cat "$1" | grep "male" | cut -d , -f 1,2 | tr "," " " | sort -k1,1 -k2,2n | uniq > uniqgend-yearsExp.txt

#This section returns the gender, years experience, and wage for the highest earner
highest=$(cat "$1" | cut -d , -f 1,2,4 | tr "," " " | sort -k3rn | head -n 1) 
echo "Highest Paid Earner: "$highest"" 

#This section returns the gender, years experience, and wage for the lowest earner
lowest=$(cat "$1" | cut -d , -f 1,2,4 | tr "," " " | sort -k3rn | tail -n 2 | head -n 1)
echo "Lowest Paid Earner: "$lowest""

#This section returns the number of females in the Top 10 Earners
num_female=$(cat "$1" | cut -d , -f 1,4 | tr "," " " | sort -k2nr | head -n 10 | grep "female" | wc -l)
echo "Number of Females in the Top 10 Earners: "$num_female""

#This section compares the effect of graduating college (16 years - 12 years) on minumum wage. Its output is the difference of lowest wage from graduating college and the lowest wage from not graduating college (12 years of school) 
val1=$(cat "$1" | cut -d , -f 3,4 | tr "," " " | grep -w 16 | sort -k2n | uniq | head -n 1 | cut -d " " -f 2)
val2=$(cat "$1" | cut -d , -f 3,4 | tr "," " " | grep -w 12 | sort -k2n | uniq | head -n 1 | cut -d " " -f 2)
val3=$(echo "$val1-$val2" | bc)
echo "Difference Between Minimum Wage from Graduating College vs. Not: $"$val3""

