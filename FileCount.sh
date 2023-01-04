BASE_DIR="/tmp/"
TOTAL_FILES=0
MAX_ALLOWED_FILES=1
for file in `find $BASE_DIR -type d|grep -v STAT|grep -v ARCH|grep -v arch|grep -v DNS`
do
        TOTAL_FILES=`find $file -maxdepth 1 -type f | wc -l`
        if test $TOTAL_FILES -ge $MAX_ALLOWED_FILES
        then
	echo $file: $TOTAL_FILES 
        fi
	done
