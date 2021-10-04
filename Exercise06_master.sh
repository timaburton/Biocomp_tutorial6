
# Problem 01

echo "Problem 01"
cat wages.csv | grep -v "gender" | cut -d , -f 1,2 | sed 's/,/ /g'| sort -V | uniq 

# Problem 02

# This script provides information on the lowest earner, highest earner, and number of females in the top ten earners
# Usage: bash Problem02.sh file_containing_wage_information.csv

echo "Problem 02"

echo "Information on Highest Earner"

cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | tail -n 1

echo "Information on Lowest Earner"

cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | head -n 1

echo "Number of Females in Top Ten Earners"

cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | tail -n 10 | cut -d " " -f 1 | sort | uniq -c | grep "female"

# Problem 03

# This script provides the difference in minimum wage for someone who did and did not graduate college (12 vs. 16 years of school)
# Usage: bash Problem03.sh file_containing_wage_information.csv

echo "Problem 03"

val1=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "12 " | head -n 1 | cut -d " " -f 2)
val2=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "16 " | head -n 1 | cut -d " " -f 2)

echo "The effect of graduating college (12 vs. 16 years) on minimum wage is a difference of:" 
echo "$val2 $val1" | awk '{print $1-$2}'

