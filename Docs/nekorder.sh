#!/bin/bash

for file in $10.f*; do
	echo $file
	num=$(echo "$file" | sed 's/reci0\.f//; s/^0*//')
	new_num=$(printf "%05d" $((num - $2 + 1)))    
	echo $new_num    
       	mv "$file" "reci0.f$new_num"
done

#using example: nekorder reci 501
#reci: case name
#501 : start-number which should become 1
