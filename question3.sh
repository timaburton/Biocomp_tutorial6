#Returns the average wage of a college educated employee and an non-college educated employye
#Usage  bash question3.sh file.csv
cat $1 | cut -d "," -f 3,4 | sort -V -k 1 | grep "16," | cut -d "," -f 2 > question3College.txt
college=$(awk '{sum+= $1; count++ } END {print sum/count;}' question3College.txt)
echo "The average college educated employee makes " $college  


cat $1 | cut -d "," -f 3,4 | sort -V -k 1 | grep -v "16," | cut -d "," -f 2 > question3Non.txt
non=$(awk '{sum+= $1; count++ } END {print sum/count;}' question3Non.txt)

first=$(echo $college | cut -d "." -f 1)
second=$(echo $non | cut -d "." -f 1)
echo "The average non-college educated employee makes " $non
echo "Therefore the average college educated employee makes around" $(($first-$second)) "dollars more than the average non-college educated employee"
