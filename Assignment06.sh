##Executes the commands from Assignment6.
#Usage: bash Assignment06.sh wages.csv

#Creates a new file with "gender yearsExperience" that is sorted first by gender, then by years experience. 
cat "$1" | cut -d, -f1,2 | sed 's/,/ /g' | sort -t ' ' -k1,1 -k2,2 > genderyearsExperience.txt

#Returns three outputs: (1) gender, yearsExperience and wage of the highest earner, (2) gender, yearsExperience, and wage for the lowest earner, and (3) the number of females in the top ten earners in the data set. 
echo HighestEarner
cat "$1" | sed '1d' | cut -d, -f1,2,4 | sort -t "," -k3,3 | tail -n 1
echo LowestEarner
cat "$1" | sed '1d' | cut -d, -f1,2,4 | sort -t "," -k3,3 | head -n 1
echo WomeninTop10Earners
cat "$1" | sed '1d' | cut -d, -f1,2,4 | sort -t "," -k3,3 | tail -n 10 | grep -o 'female' | wc -w

#Returns the effect of graduating college on the minimum wage for earners in the dataset, in the form of a difference between the two means.
echo EffectofCollege
awk -F, '$3=="12"' "$1" > highschoolgrads.txt
awk -F, '$3=="16"' "$1" > collegegrads.txt
highschoolaverage=$(awk -F, '{total += $4} END {print total/NR}' highschoolgrads.txt)
collegeaverage=$(awk -F, '{total += $4} END {print total/NR}' collegegrads.txt)
echo "$collegeaverage - $highschoolaverage" | bc
rm highschoolgrads.txt
rm collegegrads.txt
