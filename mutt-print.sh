#!/bin/sh

# Save this file to $HOME/bin/mutt-print.sh 

# Printing emails from mutt.
#
# With thanks to 'https://annvix.com/using_mutt_on_os_x'
#
pfile="${1}"
pdir="${HOME}/tmp/mutt_print"

# if the directory 'pdir' doesn't exist, create it
if [ ! -d ${pdir} ]; then
    mkdir -p ${pdir}
fi

# delete any old temporary files first
rm -f ${pdir}/mutt_*.pdf

tmpfile="`mktemp ${pdir}/mutt_XXXXXXXX`"
mv -f ${tmpfile} ${tmpfile}.pdf

# use 'paps' to create a '.ps' file from the email
paps --header --font="Verdana 11" ${1} > ${tmpfile}.ps

# use 'ps2pdf' (part of the 'ghostscript' package) to convert the '.ps' to a '.pdf'
ps2pdf -sPAPERSIZE=a4 -dOptimize=true -dEmbedAllFonts=true ${tmpfile}.ps ${tmpfile}.pdf

# the .ps file is no longer needed and can be deleted
rm -f ${pdir}/mutt_*.ps

# preview the .pdf file
evince ${tmpfile}.pdf

