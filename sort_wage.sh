#output highest and lowest earners  
#usage: bash sort_wages.sh wage.csv

echo "Lowest Earner" ;
cat $1 | cut -d, -f1 -f2 -f4 | sort -t, -k3 -n | head -n2 | tail -n1 ;
echo "Highest Earner" ;
cat $1 | cut -d, -f1 -f2 -f4 | sort -t, -k3 -n | tail -n1 ;
echo "Women in Top 10" ;
cat $1 | cut -d, -f1 -f2 -f4 | sort -t, -k3 -n | tail -n10 | grep "female" | wc -l 

