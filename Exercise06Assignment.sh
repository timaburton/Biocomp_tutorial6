#Creeates a file containing unique gender and years experience combinations, sorted by gender and
#then by years of experience. Returns the gender, years of experience, and wage of the lowest 
#and highest earner to stdout, the number of females in the top ten earners, and th effect 
#of graduating college on minimum wage of earners in dataset.

#Usage: bash Exercise06Assignment.sh 'name_of_file'

cat $1 | cut -d , -f 1,2 | tr ',' ' ' | grep 'male' | sort -n | uniq > genderyrsexp.txt

echo "Gender, Yrs Exp, Age of Highest Earner:"
cat $1 | sort -V -t ',' -k 4,4 | grep 'male' | tail -n 1 | cut -d , -f 1,2,4 
echo "Gender, Yrs Exp, Age of Lowest Earner:"
cat $1 | sort -V -t ',' -k4,4 | grep 'male' | head -n 1 | cut -d , -f 1,2,4
echo "Number of females in top ten earners:"
cat $1 | tr ',' ' ' | sort -V -k 4,4 | tail -n 10 | grep -c 'female'

echo "Difference between minimum wage of college and high school graduates:"
lowhs=$(cat $1 | cut -d , -f 1,2 | grep "12," | cut -d , -f -2 | sort -V | head -n 1)
lowcol=$(cat $1 | cut -d , -f 1,2 | grep "16," | cut -d , -f 2 | sort -V | head -n 1)
echo "lowcol-lowhs" | bc
