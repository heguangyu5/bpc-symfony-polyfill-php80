#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Symfony/Polyfill
mkdir -p ./Symfony/Polyfill/Php80

echo "placeholder-polyfill-php80.php" > ./Symfony/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo "Polyfill/Php80/$i" >> ./Symfony/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Symfony/Polyfill/Php80/$i
        else
            echo "cp       $i"
            cp $i ./Symfony/Polyfill/Php80/$i
        fi
    fi
done
cp bpc.conf Makefile ./Symfony/
