#Returns a sorted list based on gender and years of experience of employees of a company to a 
#file called question1Output.txt
#Usage bash question1.sh
cat $1 | cut -d "," -f 1,2 | grep "gender" -v | sed 's/,/ /' | sort -n -k 2 | sort -V > question1Output.txt
