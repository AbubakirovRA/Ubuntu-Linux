#!/bin/bash

directory=$1
if [ -d $directory ]
        then
                echo "Directory $directory exist"
        else
                echo "No such directoty"
                exit 2
fi
numbak=$(ls -al $directory | grep '[.]bak$' | wc -l)
numtmp=$(ls -al $directory | grep '[.]tmp$' | wc -l)
numbackup=$(ls -al $directory | grep '[.]backup$' | wc -l)

if [ $((numbak+numtmp+numbackup)) == 0 ]
        then
                echo "The folder is clear"
                exit 1
        else
                echo "Current directory has $numbak .bak, $numtmp .tmp, $numbackup .backup files"
fi
echo "Do you want to clear the folder?"
read -p "Continue? (Y/N): " confirm

if [ $confirm == "y" ]
        then
                for i in  $(find $directory -name '*.bak' -or -name '*.tmp' -or -name '*.backup')
                    do
                         rm $i
                    done
                exit 1
        else
                echo "Answer No"
                exit 2
fi