#!/bin/bash
while read student_info ;
do
	if [[ -d "$student_info" ]]
	then
		if [[ -f  $student_info/"password.txt" ]] 
		then	
			if [ "$(grep "$student_info" 237.txt)" = "$(head -1 $student_info/"password.txt")" ]
			then (( s=3 ))
			else(( s=2 )) 
			fi
		else (( s=1 ))
		fi
	else (( s=0 ))
	fi
	echo "$student_info : $s"
done
