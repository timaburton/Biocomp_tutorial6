tail -n +2 wages.csv | cut -d , -f1,2 | sort -u | sed 's/,/ /' | sort -t" " -k1,1 -k2n,2 > question1-gender-yearsExperience.txt

echo "1)the gender, yearsExperience, and wage for the highest earner:"; sort -t"," -k4n,4 wages.csv | tail -n 1 | cut -d , -f1,2,4
echo "2)the gender, yearsExperience, and wage for the lowest earner:"; sort -t"," -k4n,4 wages.csv | head -n 2 | cut -d , -f1,2,4 | tail -n 1
echo "3)the number of females in the top ten earners:"; sort -t"," -k4n,4 wages.csv | tail -n 10 | egrep 'female' -c

min16=$(sort -t"," -k4n,4 wages.csv | cut -d , -f3,4 | egrep '16,' | head -n 1 | cut -d , -f2 | tr -d $'\r')
min12=$(sort -t"," -k4n,4 wages.csv | cut -d , -f3,4 | egrep '12,' | head -n 1 | cut -d , -f2 | tr -d $'\r')
echo "min wage for 16 schoolyears is $min16"
echo "min wage for 12 schoolyears is $min12"
echo "so min wage for 16 school is higher than min wage for 12 years, subtracting result:"
echo "$min16 - $min12" | bc
