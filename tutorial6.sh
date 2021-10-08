# Use to complete tasks 1-3 of Exercise06
# usage: bash tutorial6.sh $SourceFileName $Task1NewFileName   

cat $1 | tail -n +2 | cut -d , -f 1-2 | tr -s ',' ' ' | sort -u -t ' ' -k1,1 -k2,2n > $2

echo "Highest Earner:"
cat $1 | cut -d , -f 1,2,4 | tail -n +2 | sort -t ',' -k3 -V |tail -n 1
echo "Lowest Earner:"
cat $1 | cut -d , -f 1,2,4 | tail -n +2 | sort -t ',' -k3 -V | head -n 1
echo "Number of females in top ten earners:"
cat $1 | cut -d , -f 1,4 | tail -n +2 | sort -t ',' -k2 -V | tail -n 10 | grep female | wc -l

echo "Effect of graduating college:"
valhs=$(cat $1 | cut -d , -f 3,4 | tail -n +2 | sort -t ',' -k2 -V | grep ^12 | head -n 1 | cut -d , -f 2)
valcol=$(cat $1 | cut -d , -f 3,4 | tail -n +2 | sort -t ',' -k2 -V | grep ^16 | head -n 1 | cut -d , -f 2)
echo "$valcol - $valhs" | tr -d $'\r' | bc

