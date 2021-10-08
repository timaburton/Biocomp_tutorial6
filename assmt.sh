#Author: Donghyun Jeong
#Input: None
#Output: to Stdout and creates one txt file 


#Part A: Generating a file with combinations of gender and years experience
#saves to file named "uniqueGenExpCombo.txt"

tail -n +2 wages.csv | sort -t ',' -k1,1 -k2,2n | cut -d , -f1,2 | uniq >> temp.txt
cat temp.txt | tr ',' ' ' > uniqueGenExpCombo.txt
rm temp.txt
echo "Unique Combinations of Gender and Experience saved to uniqueGenExpCombo.txt"

#Part B: Highest Earners

echo "Higest Earner: Gender, Years Experience, Wage"
tail -n +2 wages.csv | sort -t ',' -k4 -n | cut -d ',' -f1,2,4 | tail -n 1

echo "Lowest Earner: Gender, Years Experience, Wage"
tail -n +2 wages.csv | sort -t ',' -k4 -n | cut -d ',' -f1,2,4 | head -n 1

echo  "Number of Femails in the top 10 highest earners"
tail -n +2 wages.csv | sort -t ',' -k4 -n | cut -d ',' -f1,2,4 | tail -n 10 | grep "female" -o | wc -l

#Part C: Effects of Education

#Define the number of people who have less than and more than 16 years of school
hscount=$(tail -n +2 wages.csv | sort -t ',' -k3 -n | grep -E -o ",.*,[0-9][0-5]*," | wc -l)
clcount=$(tail -n +2 wages.csv | sort -t ',' -k3 -n | grep -E -o ",.*,[0-9][6-9]," | wc -l)

echo "Minimum wage for people with less than 16 years of school"
tail -n +2 wages.csv | sort -t ',' -k3 -n | head -n $hscount | sort -t ',' -k4 -n | head -n 1 | cut -d , -f4

echo "Minimum wage for people with more than or equal to 16 years of school"
tail -n +2 wages.csv | sort -t ',' -k3 -n | tail -n $clcount | sort -t ',' -k4 -n | head -n 1 | cut -d , -f4 
