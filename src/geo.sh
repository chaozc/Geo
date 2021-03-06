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
compileonly=0
independent=0
Usage() {
	echo "************************************************"
	echo -e "\t\tGeo shell\t\t"
    echo "Usage: geo.sh [options] [.g file]"
    echo "[options]:"
    echo "-k    Keep intermediate files"
    echo "-i    Build independent executable python code"
    echo "-c    Compile ONLY without execute it"
    echo "-h    Print this help"
    echo "************************************************"
    exit 1
}

Addlib(){
	cat $1 | sed 's/from sysgeo import \*//' > $1'geotemp'
	cat sysgeo.py $1'geotemp' > $1
	rm -f $1'geotemp'
}

Compile(){
	eval "$GEO<$1>temp.gout"
	eval "python insert.py temp.gout > $2"
	rm -f temp.gout
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

while getopts khci ca; do
    case $ca in
    c)
		compileonly=1
		;;
	i)
		independent=1
		;;
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
	if [ $independent -eq 1 ]; then
		Addlib $copfile
	fi
	if [ $keep -eq 0 ]; then
		rm -f $opfile
	fi
	if [ $compileonly -eq 0 ]; then
		Execute $copfile
	fi
fi