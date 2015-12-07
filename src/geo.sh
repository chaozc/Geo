#!/bin/bash
########################################
#				geo.sh
#
#		Geo compiler shell script
#			  Version 0.01
#			   12/06/2015
########################################

GEO='./geo'
opfile=''
copfile=''
keep=0
Usage() {
	echo "************************************************"
	echo -e "\t\tGeo shell\t\t"
    echo "Usage: geo.sh [options] [.g files]"
    echo "-k    Keep intermediate files"
    echo "-h    Print this help"
    echo "************************************************"
    exit 1
}

Compile(){
	eval "$GEO<$1>$2"
}

Execute(){
	eval "python $1"
}

Precat(){

	grep '@[^eE]' $1 >&2
	if [ -e std.glib ]; then
		cat std.glib >&2
	else
		echo "$0 warning: std.glib does not exist."
	fi
	cat $1 | sed 's/^@.*$//' >&2
	echo >&2
	echo @end >&2
}

while getopts kh c; do
    case $c in
	k) # Keep intermediate files
	    keep=1
	    ;;
	h) # Help
	    Usage
	    ;;
    esac
done

shift `expr $OPTIND - 1`

if [ $# -ge 1 ]; then
	opfile=$1'pre'
	rm -f $opfile
	Precat $1 2>> $opfile
	if [ $# -eq 1 ]; then
		copfile=`echo $opfile | sed 's/.gpre/.py/'`
	else
		copfile=$2
	fi
	Compile $opfile $copfile
	if [ $keep -eq 0 ]; then
		rm -f $opfile
	fi
	Execute $copfile
fi