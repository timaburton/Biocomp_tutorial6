#first code will find unique gender-yearsExperience combinations from the wages.csv file in the Biocomp_tutorial6 folder
#usage: cut -flag "delimiter" -flag fields_to_cut file_name | sed 'row_to_cut' | sort -flag | sed 's/variable_to_replace/variable_subbing_in/g' | uniq

cut -d "," -f 1,2 $1 |sed '1d' |sort -V | sed 's/,/ /g' | uniq


#second code will first display the highest earning individual followed by the lowest earning individual and
#end by displaying the total number of females in the top 10 of earners among the list

#usage: variable=$(cut -d delimiter -f columns_to_keep filename | sed 'line_to_remove' | sort -t delimiter -k column_to_sort_by -n | tail -number_of_lines_from_bottom
highEarner=$(cut -d "," -f 1,2,4 $1 |sed '1d' |sort -t ',' -k 3 -n | tail -1)
echo "This is the highest earner of the group: $highEarner"

#usage: variable=$(cut -d delimiter -f columns_to_keep filename | sed 'line_to_remove' | sort -t delimiter -k column_to_sort_by -n | headd -number_of_lines_from_top
lowEarner=$(cut -d "," -f 1,2,4 $1 |sed '1d' |sort -t ',' -k 3 -n | head -1)
echo "This is the lowest earner of the group: $lowEarner"

#usage: variable=$(cut -d delimiter -f columns_to_keep filename | sed 'line_to_remove' | sort -t delimiter -k column_to_sort_by -nr (reverse numeric) |
#head -number_of_lines_from_bottom | sed '/lines_starting_with_letter_to_delete/d' | wc -what_to_count
topFemales=$(cut -d "," -f 1,2,4 $1 |sed '1d' |sort -t ',' -k 3 -nr |head -10 |sed '/^m/d' | wc -l) 
echo "The number of females in the top 10 earners: $topFemales"


#3rd code will set two variables equal to a pipeline that will identify the lines in which individuals have 12 and 16 years of education,
#and will find the difference between the minimum and average wages of both groups. Finally, this difference will be printed

#usage: variable=$(cut -d delimiter -f columns_to_keep filename|sed -n '/keepline_starting_with_number/p' |cut -d delimiter -f column_to_keep |
#sort -typeofsort | head -lines_from_top_to_pull
min16=$(cut -d "," -f 3,4 $1 | sed -n '/^16/p'| cut -d "," -f 2| sort -n| head -1)
min12=$(cut -d "," -f 3,4 $1 | sed -n '/^12/p'| cut -d "," -f 2| sort -n| head -1)

#usage: echo "string_of_characters_to_print "
#usage: echo "variable1-variable2_print_results" | bc
echo "Difference in minimum wages due to graduating:"
echo "$min16 - $min12"| bc

#usage: variable=$(cut -d delimiter -f columns_to_keep filename|sed -n '/keepline_starting_with_number/p' |cut -d delimiter -f column_to_keep |
#awk '{variable_name+=sprintf("%number_type", $column_number)} END{printf "%number_type\newline", variable/NR}') 
avg16=$(cut -d "," -f 3,4 $1 | sed -n '/^16/p'| cut -d "," -f 2| awk '{sum+=sprintf("%f",$1)}END{printf "%.6f\n",sum/NR}')
avg12=$(cut -d "," -f 3,4 $1 | sed -n '/^12/p'| cut -d "," -f 2| awk '{sum+=sprintf("%f",$1)}END{printf "%.6f\n",sum/NR}')

#usage: echo "string_of_characters_to_print "
#usage: echo "variable1-variable2_print_results" | bc
echo "Graduating from college shows hire earning wages by an average of " 
echo "$avg16-$avg12" | bc
