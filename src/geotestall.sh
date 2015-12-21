#!/bin/bash
########################################
#				geo.sh
#
#		Geo compiler shell script
#			  Version 0.01
#			   12/06/2015
########################################

GEO='./geo.sh'
globallog=testall.log
rm -f $globallog
error=0
globalerror=0
keep=0
Usage() {
	echo "************************************************"
	echo -e "\t\tGeo tests shell\t\t"
    echo "Usage: geo.sh [options] [.g files]"
    echo "-k    Keep intermediate files"
    echo "-h    Print this help"
    echo "************************************************"
    exit 1
}

Compile(){
	eval "$GEO -c $1"
	opname=`echo $1 | sed 's/.py/.out/'`
	eval "python $1 > $opname"
}

SignalError() {
    if [ $error -eq 0 ] ; then
	echo "FAILED"
	error=1
    fi
    echo "  $1"
}

Compare() {
    generatedfiles="$generatedfiles $3"
    echo diff -b $1 $2 ">" $3 1>&2
    diff -b "$1" "$2" > "$3" 2>&1 || {
	SignalError "$1 differs"
	echo "FAILED $1 differs from $2" 1>&2
    }
}

Check(){
	error=0
	Compile $1
    basename=`echo $1 | sed 's/.*\\///
                             s/.g//'`
    basedir="`echo $1 | sed 's/\/[^\/]*$//'`/."
    reffile=`echo $a | sed 's/.g$//'`
    echo -n "$basename..."

    echo 1>&2
    echo "###### Testing $basename" 1>&2

    generatedfiles=""

    generatedfiles="$generatedfiles ${basename}.out" &&
    Compare ${reffile}.out ${reffile}.ref ${reffile}.diff


    if [ $error -eq 0 ] ; then
	if [ $keep -eq 0 ] ; then
	    rm -f $generatedfiles
	fi
	echo "OK"
	echo "###### SUCCESS" 1>&2
    else
	echo "###### FAILED" 1>&2
	globalerror=$error
    fi
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

if [ $# -ge 1 ]
then
    files=$@
else
    files="tests/test-*.g"
fi
for file in $files
do
	case $file in
	*test-*)
		Check $file 2>> $globallog
		;;
	*)
	    echo "unknown file type $file"
	    globalerror=1
	    ;;
    esac
done
	
exit $globalerror