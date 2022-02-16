#!/bin/bash

function _usage_(){
cat << EOF
Usage:
     help|-h|--help             Displays this help
     config <REMOTE_SERVER_IP>  Generate StrongPassword DIY to files.
     password                   Generate StrongPassword

Such as:
    ./entrypoint.sh config 1.1.1.1
    ./entrypoint.sh password
    ./entrypoint.sh help|-h|--help
EOF
exit 0
}

function _Generate_Users_StrongPassword_Algorithm(){
	local i tmp size max rand
	# $RANDOM % (i+1) is biased because of the limited range of $RANDOM
	# Compensate by using a range which is a multiple of the array size.
	Pass_Sting_Array=('b' 'i' 'n' 'a' 'x' 'n' '$' '@' '%' '#' '3' '2' '4' '5' 'B' 'I' 'N' 'A' 'X' 'N')
	size=${#Pass_Sting_Array[*]}
	max=$(( 32768 / size * size ))
	for ((i=size-1; i>0; i--)); do
		while (( (rand=$RANDOM) >= max )); do :; done
		rand=$(( rand % (i+1) ))
		tmp=${Pass_Sting_Array[i]} Pass_Sting_Array[i]=${Pass_Sting_Array[rand]} Pass_Sting_Array[rand]=$tmp
	done
  _Pass_From_GUSP_Algo=$(printf "%s" "${Pass_Sting_Array[@]}")
}

function  _SCSMAIN_Domain_Mail_Manage_Logic(){
_Generate_Users_StrongPassword_Algorithm
# root dir or work dir. such as /annealing-plantform

project=($(cat .github/workflows/deploy*.yml |grep "project:"| awk -F'"' '{print $2}'))
project_name_CountPort=10010
for porject_name in "${!project[@]}"; do
let project_name_CountPort++

cat >>${project[$porject_name]}.ini<<EOF
#cat << EOF
[common]
server_addr = $REMOTE_SERVER_IP
server_port = 7000
token = B43niB43B43niB43niA5a
tls_enable = true

[项目_${project[$porject_name]}_SOCKS5_$project_name_CountPort]
type = tcp
remote_port = $project_name_CountPort
plugin = socks5
plugin_user = ${project[$porject_name]}
plugin_passwd = $_Pass_From_GUSP_Algo
use_compression = true
EOF
done
mv ${project[$porject_name]}.ini ${project[$porject_name]}/
}

if [ "$#" -eq 0 ] ; then
   _usage_
   exit 0
fi

# some cases to check what function to transfer.
case $1 in
   config )
       REMOTE_SERVER_IP=$2
       _SCSMAIN_Domain_Mail_Manage_Logic
       # ./scripts/entrypoint.sh config {{secrets.REMOTE_SERVER_IP}}
       ;;
   password )
       _Generate_Users_StrongPassword_Algorithm
       echo $_Pass_From_GUSP_Algo
       # ./scripts/entrypoint.sh password
       # to Generate StrongPassword
       ;;

   help | -h | --help )
       _usage_
       ;;
   * )
       printf "annealing-plantform：illegal option -- $1 \nTry '--help' for more information."
       ;;
esac