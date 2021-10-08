#This shell script accomplishes three tasks and was made specifically for the file wages.csv. 
#First, all unique gender and years of experience combinations are sorted into a separate file.
#Second, the gender, years of experience, and wage for the highest and lowest earners are returned, as well as the number of females in the top ten earners. 
#Finally, the effect of graduating college on the minimum wage for earners is returned. 

#Usage: bash exercise06script.sh

#Question 1
cat wages.csv | cut -d , -f 1,2 | sort -k1,1d -k2,2n -t , | uniq | sed 's/,/ /g' | grep -E male > sortedwages.txt

#Question 2
#highest wage earner
echo "Highest wage earner"
echo | cat wages.csv | cut -d , -f 1,2,4 | sort -k 3,3n -t , | grep male | tail -n 1
#lowest wage earner
echo "Lowest wage earner"
echo | cat wages.csv | cut -d , -f 1,2,4 | sort -k 3,3n -t , | grep male | head -n 1
#number of females in top ten earners
echo "Number of females in top ten earners"
echo | cat wages.csv | cut -d , -f 1,2,4 | sort -k 3,3n -t , | tail -n 10 | grep female | wc -l

#Question 3
echo "Effect of graduating college on minimum wage"
no_college=$(cat wages.csv | cut -d , -f 1,3,4 | sort -k 2,2n -k 3,3n -t , | grep -E ",12," | head -n 1 | cut -d , -f 3)
graduated_college=$(cat wages.csv | cut -d , -f 1,3,4 | sort -k 2,2n -k 3,3n -t , | grep -E ",16," | head -n 1 | cut -d , -f 3)
echo "$graduated_college - no_college" | bc
