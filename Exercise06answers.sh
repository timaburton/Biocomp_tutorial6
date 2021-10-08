#This shell script will create unique gender and years experience for those in the wages file
#For Exercise06answer.ssh 'name_of_file'

for file in (1..100)
do 
cut -d, -f 1,2 $1 | tr ',' ' ' | sort -n -k 2 | uniq > sortedwages.txt
done 

echo "Highest Wage"
cat $1 | tr ',' ' ' | sort -k 4 -n4 | tail -n 1 | cut -d ' ' -f 1,2,4
echo "Lowest Wage" 
cat $1 | tr ',' ' ' | sort -k 4 -n | head -n 2 |  tail -n 1 | cut -d ' ' -f 1,2,4
echo "Females in Top 10 of Earnings" 
cat $1 | tr ',' ' ' | sort -k 4 -n | tail -n 10 | grep -c "female"

echo "Effect of college on minimum wage"
minHS=$(cat $1 | grep ",12," | cut -d, -f 4 | sort -n | head -n 1)
mincollege=$(cat $1 | grep ",16," | cut -d, -f 4 | sort -n | head -n 1)
echo "$mincollege - $minHS" | bc


