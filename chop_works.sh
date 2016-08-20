#!/bin/sh

# Script to strip URI down to and then create dir struct

# TODO create user choosable output switch:
#
# ;w /dev/stdout' $file


# salve
echo "Strips URI down to and then creates dir struct by line in from \\n delimited file list."
echo

# read input file
read -p "Input file: " file

# remove any ec0 uri's
# TODO use one sed query for ec0|ak0
sed -ri .bak 's/http:\/\/media-cache-ec0.pinimg.com\///' $file

# remove any ak0 uri's
# TODO see above
sed -ri 's/http:\/\/media-cache-ak0.pinimg.com\///' $file

# remove filtype ext
sed -ri 's/.jpg//' $file 

# remove 32 trailers (like a twister)
sed -ri 's/.{32}$//' $file

# TODO make this work some day
#sed -ri 's/[a-z0-9]\{15,\}.jpg//' $file

# print w sed, chop and sel wit awk
sed p $file | awk -F'/' '{print $1"/" $2"/" $3"/" $4}'

# mk dirs
mkdir -pv $(cat < ptest)

