#!/bin/bash
#FILELIST=`ls *.PDF`
WORKDATE=`date +%y%m%d-%s`
RMDATE=`date`

PRJDIR=$HOME/ProjectPlates
PDFDIR=$PRJDIR/PDF
PNGDIR=$PRJDIR/PNG
README=$PNGDIR/README.md
LOGDIR=$PRJDIR/LOG
LOGFILE=${LOGDIR}/converted_$WORKDATE.log

FILELIST=$(find $PDFDIR -iname '*.pdf')

# echo $FILELIST

for FILE in $FILELIST ; do

FILE="${FILE##/}"
FILENOPATH="${FILE##*/}"

READMEPNG=${FILENOPATH%.*}.png

PNGOUT=${PNGDIR}/${FILENOPATH%.*}.png

cat << EOF >> $LOGFILE
echo "Converting /${FILE} to ${PNGOUT}"
EOF

convert /${FILE} ${PNGOUT}


done


cat << EOF >> $README
Images Added: $RMDATE
<pre>
EOF

ls $PNGDIR | grep .png  >> $README

cat << EOF >> $README
</pre>
END README

EOF


exit 0
