#This script creates a unique gender-years experience combinations from the file wages.csv
#usage Exercise06Answer.sh name_of_file

cut -d , -f 1,2 wages.csv | sed -E 's/,//' | sort -V > wagesorted.txt

echo "Highest Earner:"
cat $1 | tr ',' ' ' | sort -k 4 -n | tail -n 1 | cut -d ' ' -f 1,2,4

echo "Lowest Earner:"
cat $1 | tr ',' ' ' | sort -k 4 -n | head -n 2 | tail -n 1 |cut -d ' ' -f 1,2,4

echo "Number of females in Top 10 Earners:"
cat $1 | tr ',' ' ' | sort -k 4 -n | tail -n 10 | grep -c female

echo "Effect of Graduating College:"
lowhs=$(cat $1| grep ",12," | cut -d , -f 4 | sort -n | head -n 1)
lowcd=$(cat $1| grep ",16," | cut -d , -f 4 | sort -n | head -n 1)
echo "lowcd - lowhs" | bc
