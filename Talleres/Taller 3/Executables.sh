# ./bin/bash
let i=0
for file in $(ls *.c)
	do 
	let i++
	gcc -o "Example$i.out" -c $file
	grep -A 1 'Example' $file
	chmod u+x "Example$i.out"
	./"Example$i.out"
	rm "Example$i.out"
	read -p "Press any key to continue... " -n1 -s 
	if (($i==30))
	then
	break
	fi
	done