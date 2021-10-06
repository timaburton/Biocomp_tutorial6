
#1.

cat "$1" | grep -v "gender" | cut -d , -f 1,2 | sed 's/,/ /g'| sort -V | uniq > uniq.txt


#2.

echo "Highest Earner"
cat "$1" | grep -v "gender" | sort -t "," -k4,4nr | cut -d, -f 1,2,4 | head -n 1
echo "Lowest Earner"
cat "$1" | grep -v "gender" | sort -t "," -k4,4n |  cut -d, -f 1,2,4 | head -n 1
echo "Females in Top 10 Earners"
cat "$1" | sort -t "," -k4,4nr | head -n 10 | grep -E "female" | wc -l


#3.

x1=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "12 " | head -n 1 | cut -d " " -f 2)
x2=$(cat "$1" | grep -v "gender" | cut -d , -f 3,4 | sort -n | sed 's/,/ /g' | grep "16 " | head -n 1 | cut -d " " -f 2)

diff="$x2-$x1"

echo "The effect of graduating college on minimum wage is a difference of:" 
echo "$x2 $x1" | awk '{print $1-$2}' 
