#Returns the top earner in a company, the lowest earner in the company, and 
#the number of females in the top ten earning wage positions in the company
#Usage bash question2.sh file.csv

variable=$(cat $1 | cut -d "," -f 1,2,4 | grep "gender" -v | sed 's/,/ /' | sed 's/,/ /' | sort -V -r -k 3 | head -n 1)
echo "Gender  Years of Experience  Wage"
echo $variable " Top Earner in the Company "  

variable2=$(cat $1 | cut -d "," -f 1,2,4 | grep "gender" -v | sed 's/,/ /' | sed 's/,/ /' | sort -V -k 3 | head -n 1)
echo $variable2 "Lowest Earner in the Company"

variable3=$(cat $1 | cut -d "," -f 1,2,4 | grep 'gender' -v | sed 's/,/ /' | sed 's/,/ /' | sort -V -r -k 3 | head -n 10 | grep  -c "female" )
echo $variable3 "Number of females in the top ten earners"
