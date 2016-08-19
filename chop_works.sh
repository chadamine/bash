echo "This script will remove http data before each line of text in an input file as well as the .[filetype] ending following the image name, preserving original file structure"

read -p "Input file: " file
#read -p "\n\nVerbose output?(1|0) " ver

sed -ri 's/http:\/\/media-cache-ec0.pinimg.com\///' $file
# ;w /dev/stdout' $file

sed -ri 's/http:\/\/media-cache-ak0.pinimg.com\///' $file
# ;w /dev/stdout' $file

#sed -ri 's/[a-z0-9]\{15,\}.jpg//' $file
#;w /dev/stdout' $file 

sed -ri 's/.jpg//' $file #| awk -F'/' '{print $1// $2// $3}'
# ;w /dev/stdout' $file

sed -ri 's/.{32}$//' $file
#sed -ri '/^.$/' $file | awk -F'/' '{print $1// $2// $3}' 

#echo '736x/e6/56/a6/e656a6e610c9c210889425077499d58c' | awk -F'/' '{print $1"/" $2"/" $3"/" $4}'
