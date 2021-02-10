#!/bin/bash

# README.sh
# Auto-README.md-maker

OUTFILE='./README.md'
LISTFILE='./repos'
GETFILE='./get.md'
LIST=`cat ${LISTFILE}`
DATE=`date`

# echo -e "# Aktuelle Projekte\n" > $OUTFILE

for REPO in ${LIST}; do
  wget --no-cache -O ${GETFILE} "https://raw.githubusercontent.com/ingank/${REPO}/master/README.md"
  cat ${GETFILE}
  TRAILER=$(head -1 ${GETFILE} | sed 's/# //g')
  SUMMARY=$(sed -n '3p' ${GETFILE})
  echo -e "### [\`$TRAILER\`](https://github.com/ingank/$REPO/)" >> $OUTFILE
  echo -e "\`$SUMMARY\`\n" >> $OUTFILE
done

rm ./$GETFILE

echo -e "\n---\n" >> $OUTFILE
echo "\`aktualisiert am $DATE\`" >> $OUTFILE
