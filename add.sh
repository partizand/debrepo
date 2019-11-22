#!/bin/bash

BASEDIR=`dirname "$0"`

codename="buster"
#codename=`kdialog --radiolist "Select codename:" buster "buster" on  bullseye "bullseye" off`

package_type=`kdialog --radiolist "Select package type:" deb "deb" on source "source" off`

if [ package_type = "deb" ]; then
    # Ask deb file
    debfile=`kdialog --getopenfilename . "Deb files (*.deb)" `
    if [ -z $debfile ] ; then 
        echo "User debfile cancelled"
        exit 1
    fi
    
    echo Adding $debfile ...
    # Add deb file
    reprepro -b ${BASEDIR} -C main includedeb $codename "$debfile"

elif [ package_type = "source" ]; then
    # Ask change file
    changefile=`kdialog --getopenfilename . "Change files (*.changes)" `
    if [ -z $changefile ] ; then 
        echo "User debfile cancelled"
        exit 1
    fi
    # Add change file
    reprepro -b ${BASEDIR} -C main include $codename "$changefile"
else 
    echo "User cancelled"
    exit 1
fi

# Fill package list
reprepro -b ${BASEDIR} list $codename > "${BASEDIR}/${codename}-list.txt"

# Git choise

gitchoise=`kdialog --checklist "Select git operations:" commit "Commit" off  push "Push" off`

commit=false
push=false

if [ "$?" = 0 ]; then
	if [ $(expr length "$gitchoise") != 0 ]; then
		for result in $gitchoise
			do
				if [ $result = '"commit"' ]; then
					#kdialog --msgbox "YOU CHOSE commit";
					commit=true
				fi;
				if [ $result = '"push"' ]; then
					#kdialog --msgbox "YOU CHOSE push";
					push=true
				fi;

			done;
	else
		#kdialog --sorry "NO SELECTION WAS MADE";
		exit 1
	fi;
elif [ "$?" = 1 ]; then
	#kdialog --sorry "YOU CHOSE CANCEL";
	exit 1
else
	kdialog --error "ERROR";
	exit 2
fi;


#exit




if [ commit ] ; then
    # git commit
    cd ${BASEDIR}
    filename=`basename $debfile`
    # git add files
    git add --all
    git commit -a -m "Add package file ${filename} to ${codename}"

    echo "git all commited"
fi
    
    




