# Usage: bash tut6.sh

#task 1

# Take input file wages.csv and creates a file named w_sorted.txt
# Rows are sorted first by gender and  yearsExperience

cat wages.csv | cut -d , -f 1,2 | tr -s "," " " | sort -V | uniq | grep -v "gender" > w_sorted.txt

#task2

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

#task 3

val1=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -t , -k 2 -h | head -n 1 | cut -d , -f 2)
val2=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^16" | sort -t , -k 2 -h | head -n 1 | cut -d , -f 2)
echo "Effect of graduating college (12 vs. 16 yrs) on minimum wage:"
echo "$val1 $val2" | awk '{print $1 - $2}'
