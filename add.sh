#!/bin/bash

BASEDIR=`dirname "$0"`

# Ask deb file
debfile=`kdialog --getopenfilename . "Deb files (*.deb)" `

if [ -z $debfile ] ; then 
    echo "User debfile cancelled"
    exit 1
fi

codename=`kdialog --radiolist "Select codename:" buster "buster" on  bullseye "bullseye" off`

if [ -z $codename ] ; then 
    echo "User codename cancelled"
    exit 1
fi


#echo $debfile

#echo $codename

#exit 0



echo Adding $debfile ...
# Add deb file
reprepro -b ${BASEDIR} -C main includedeb $codename "$debfile"

# Fill package list
reprepro -b ${BASEDIR} list $codename > "${BASEDIR}/${codename}-list.txt"

# git commit
cd ${BASEDIR}
filename=`basename $debfile`
# git add files
git add --all
git commit -a -m "Add package file ${filename} to ${codename}"

echo "git all commited"
    
    



#exit 0

# Add deb file
#reprepro -b ${BASEDIR} -C main includedeb andrey "$1"

# Fill package list
#reprepro -b ${BASEDIR} list andrey > ${BASEDIR}/packagelist.txt
