if [ -n "$1" ]
then 
str0="$1"
else
str0="$$"
fi
POS=2
LEN=15
str1=$( echo "str0" | md5sum)

randstring="${str1:$POS:$LEN}"

echo "$randstring"
exit  $?

