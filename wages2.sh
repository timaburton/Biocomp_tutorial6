#organizes data uniquely into columns of gender and years of experience
#usage: bash wages2.sh file_name

for i in [1..100]
	do
	cut -d , -f 1,2 $1 | tr ',' ' ' | sort -n -k 2 | uniq > sortwages.txt
	done

echo "Highest Earner:"
cat $1 | tr ',' ' ' | sort -k 4 -n | tail -n 1 | cut -d ' ' -f 1,2,4
echo "Lowest Earner:"
cat $1 | tr ',' ' ' | sort -k 4 -n | head -n 2 | tail -n 1 | cut -d ' ' -f 1,2,4
echo "Number of females top 10:"
cat $1 | tr ',' ' ' | sort -k 4 -n | tail -n 10 | grep -c female

echo "effect of graduating college on minimum wage"
minhs=$(cat $1|grep ",12," | cut -d , -f 4| sort -n | head -n 1)
mincollege=$(cat $1|grep ",16," | cut -d , -f 4| sort -n | head -n 1)
echo "$mincollege - $minhs" | bc
