#!/bin/bash

# README.make
# Auto-README-maker

OUTFILE='./README.md'
LISTFILE='./repos.lst'
GETFILE='./get.md'
LIST=`cat ${LISTFILE}`
DATE=`date`

echo -e "# Meine kleine Repo-Sammlung\n" > $OUTFILE

for REPO in ${LIST}; do
  wget --no-cache -O ${GETFILE} "https://raw.githubusercontent.com/ingank/${REPO}/master/README.md"
  cat ${GETFILE}
  TRAILER=$(head -1 ${GETFILE} | sed 's/# //g')
  SUMMARY=$(sed -n '3p' ${GETFILE})
  echo -e "### [\`$TRAILER\`](https://github.com/ingank/$REPO/)" >> $OUTFILE
  echo -e "\`$SUMMARY\`\n" >> $OUTFILE
done

echo -e "\n---\n" >> $OUTFILE
echo "\`aktualisiert am $DATE\`" >> $OUTFILE
