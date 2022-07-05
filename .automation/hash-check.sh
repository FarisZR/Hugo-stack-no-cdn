#/bin/sh

# 1=remote file name 2=local-file 3=js file name 4=which row 5=entry from remote 6=entry from local 6=var-name
#Get value from the local file and remote file, and compare 

remote=$(cat $1 | shyaml get-value $3.$4.$5)
local=$(cat $2 | shyaml get-value $3.$4.$6)

# if the hashes match, then it means the file is up-to-date, so no need to update.
if [ "$remote" == "$local" ] 
then
    echo "::set-output name=$7::false"
else
    echo "::set-output name=$7::true"
fi