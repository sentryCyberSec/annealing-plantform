#!/bin/bash

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
}

function _Domain_MainAccess_Manage_ByAdmin(){
	_Pass_From_GUSP_Algo=$(printf "%s" "${Pass_Sting_Array[@]}")
	echo "plugin_passwd = $_Pass_From_GUSP_Algo" >> frpc.ini
  # printf "%s" "${Pass_Sting_Array[@]}"
	# frpc config file in root dir. next need to copy to every project.
}

function  _SCSMAIN_Domain_Mail_Manage_Logic(){
	_Generate_Users_StrongPassword_Algorithm
	_Domain_MainAccess_Manage_ByAdmin
#	export Username=${Define_Mail_FullUsername}
#	export Password=${_Pass_From_GUSP_Algo}
#	envsubst  <./htmlTemp_Demo.html.template >./result.html
}

# Set gobal var here. Visit https://yandex.com/dev/domain/doc/reference/email-add.html to access api.
#Aceess_EmailList_Manage_API="https://pddimp.yandex.ru/api2/admin/email"
#Access_Domain="sentrylab.cn" #yournickname@yourdomain.com -> Access_Domain="yourdomain.com"

# in action command is: bash SCS_domail_mail_manage.sh ${{ secrets.SENTRY_MAIL_PDDTOKEN }}
#Define_PDD_Token=$1
#Define_Mail_UsernameNosuffix=$2
#Define_Mail_FullUsername="$Define_Mail_UsernameNosuffix@$Access_Domain"

_SCSMAIN_Domain_Mail_Manage_Logic
