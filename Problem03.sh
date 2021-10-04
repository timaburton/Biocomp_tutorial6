# This script provides the difference in minimum wage for someone who did and did not graduate college (12 vs. 16 years of school)
# Usage: bash Problem03.sh file_containing_wage_information.csv

val1=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "12 " | head -n 1 | cut -d " " -f 2)
val2=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "16 " | head -n 1 | cut -d " " -f 2)

echo "The effect of graduating college (12 vs. 16 years) on minimum wage is a difference of:" 
echo "$val2 $val1" | awk '{print $1-$2}' 
