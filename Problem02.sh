# This script provides information on the lowest earner, highest earner, and number of females in the top ten earners
# Usage: bash Problem02.sh file_containing_wage_information.csv

echo "Information on Highest Earner"

cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | tail -n 1

echo "Information on Lowest Earner"

cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | head -n 1

echo "Number of Females in Top Ten Earners"

cat "$1" | grep -v "gender" | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -Vk 3 | tail -n 10 | cut -d " " -f 1 | sort | uniq -c | grep "female"

