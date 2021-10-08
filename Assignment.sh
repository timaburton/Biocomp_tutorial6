# Usage: bash Assignment.sh

# first task

# This code takes the input file wages.csv and creates a file named wages_sorted.txt
# wages_sorted.txt contains gender and yearsExperience columns separated by space
# the rows are sorted first by gender and then by yearsExperience

cat wages.csv | cut -d , -f 1,2 | tr -s "," " " | sort -V | uniq | grep -v "gender" > wages_sorted.txt


# second task

# following info is returned:
# 1) the gender, yearsExperience, and wage for the highest earner
# 2) the gender, yearsExperience, and wage for the lowest earner
# 3) the number of females in the top ten earners in this data set

cat wages.csv | cut -d , -f 1,2,4 | grep -v "gender" | sort -t , -k 3 -h > task2_wages_sorted.txt
highest=$(tail -n 1 task2_wages_sorted.txt)
echo "Highest earner (gender, yearsExperience, wage): $highest"
lowest=$(head -n 1 task2_wages_sorted.txt)
echo "Lowest earner (gender, yearsExperience, wage): $lowest"
no_females=$(cat task2_wages_sorted.txt | tail -n 10 | grep -o "female" | wc -l)
echo "Number of females in top 10 earners:$no_females"


# third task

# the effect on graduating is returned

val1=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -t , -k 2 -h | head -n 1 | cut -d , -f 2)
val2=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^16" | sort -t , -k 2 -h | head -n 1 | cut -d , -f 2)
echo "Effect of graduating college (12 vs. 16 yrs) on minimum wage:"
echo "$val1 - $val2" | bc
