#1st Question
cat wages.csv | cut -d , -f 1,2 | grep -w "female" | sort -k 2  -n -t ,| tr "," " " | uniq > 1st_Question.txt
cat wages.csv | cut -d , -f 1,2 | grep -w "male" | sort -k 2  -n -t ,| tr "," " " | uniq >> 1st_Question.txt

#2rd Question
echo "the gender, yearsExprience, and wage for the highest earner:"
cat wages.csv | grep -v gender | cut -d , -f 1,2,4 | sort -k 3 -n -r -t "," | head -1
echo "the gender, yearsExprience, and wage for the lowest earnere:"
cat wages.csv | grep -v gender | cut -d , -f 1,2,4 | sort -k 3 -n -r -t "," | tail -1
echo "the number of females in the top ten earners:"
cat wages.csv | grep -v gender | cut -d , -f 1,2,4 | sort -k 3 -n -r -t "," | head -10 | grep -c "female"

#3rd Question
v1=$(cat wages.csv | cut -d , -f 3,4 | grep -w "12" | sort -k 2 -n -t "," | cut -d , -f 2 | head -1)
v2=$(cat wages.csv | cut -d , -f 3,4 | grep -w "16" | sort -k 2 -n -t "," | cut -d , -f 2 | head -1)
echo "the effect of graduating college (12 vs. 16 years of school) on the minimum wage for earners"
echo "$v2 - $v1" |tr -d $'\r'| bc 


