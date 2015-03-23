#!/bin/bash

echo -e "\n###################"
echo    "Python script"
echo    "Python version: $(python --version)"

MAIN=${PYTHON_MAIN-main.py}
STDOUT=${STDOUT-stdout.txt}

echo -e "\nLooking for ${MAIN}..."

# Python project should be mounted here.
cd /data
FILE=$(find -name main.py)

if [ ! -f "${FILE}" ] ; then
 echo "File not found!"
 exit 1
fi

echo    "EXECUTING: python ${FILE}"

python ${FILE} > ${STDOUT}

if [ "$?" != "0" ]; then
 echo "FAILED: check STDERR and STDOUT for logs."
 exit 1
else
 echo "SUCCESSFUL!"
 echo "OUTPUT: $(find -name ${STDOUT})"
fi

echo -e "\n###################"
