#!/bin/bash


FILE_NAME_ALL=`find . -name "*my_result*" `

#FILE_NAME=`echo ${FILE_NAME_ALL}|sed -e 's#.\/#\\n#g'`
#FILE_NAME=$1
ROW_NUM=`cat $FILE_NAME|wc -l`
echo "ROW_NUM is ${ROW_NUM}"

for line in ` echo ${FILE_NAME_ALL}|sed -e 's#.\/#\\n#g' `
do
echo "line is $line"

echo "start generat report"
./generateReport.sh $line
echo "end generat report"


done

echo "do done"
