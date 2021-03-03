#!/bin/bash
while read -r student 
do
    git clone https://github.com/wustlcse237sp20/"${student}".git
	cd $student
	
    git checkout cipher
    git checkout `git rev-list -n1 --before="2020-02-04 16:59:59" cipher`
	
	if [ -f "Cipher.java" ]; then
        javac Cipher.java
        java Cipher
		
        if [ -f "output.txt" ] && cmp -s output.txt "../$1"; then
			cd ..
            point=1
			echo "${student} ${point}" >> grades.txt
			
		else
			cd ..
		    point=0
			echo "${student} ${point}" >> grades.txt
		fi
		
	else
		cd ..
		point=0
		echo "${student} ${point}" >> grades.txt
	fi
done
