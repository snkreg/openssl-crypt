#!/bin/bash

# Copyright 2013 yAzZiE Labs
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


function home {
	echo Encrypt or Decrypt?
	echo
	echo [1] Encrypt
	echo [2] Decrypt
	echo
	echo -n
	read homeInput
	if [ $homeInput = "1" ]
	then
		encrypt
	fi
	if [ $homeInput = "2" ]
	then
		decrypt
	fi
}

function encrypt {
	clear
	echo Enter the Filesystem path of the directory containing the file you wish to encrypt, NOT including a trailing “/“.
	echo
	echo -n
	read encryptDir
	cd $encryptDir
	echo
	echo "Enter the name of the file you wish you encrypt, including its' file extension."
	echo
	echo -n
	read encryptFile
	echo
	echo "You will be asked for an encrytion key (password) to encrypt the file by openssl. MAKE SURE you remember it or write it down somewhere secure, as you won't be reminded what it is again.. ever."
	echo
	openssl des3 -salt -out ${encryptFile}.x -in $encryptFile
	echo
	echo Outputted "'$encryptFile'" as "'${encryptFile}.x'"
	echo Remove Old Unencrypted File? y/N
	echo
	echo -n
	read encryptOpt
	if [ $encryptOpt = "y" ]
	then
		rm $encryptFile
		echo
		echo ====================
		echo
		home
	fi
	if [ $encryptOpt = "N" ]
	then
		echo
		echo ====================
		echo
		home
	fi
}

function decrypt {
	clear
	echo Enter the Filesystem path of the directory containing the file you wish to decrypt, NOT including a trailing “/“.
	echo
	echo -n
	read decryptDir
	cd $decryptDir
	echo
	echo "Enter the name of the file you wish you decrypt, including its' full file extension."
	echo
	echo -n
	read decryptFile
	decryptNewFile=$(echo $decryptFile | sed 's/.\{2\}$//')
	openssl des3 -salt -d -out $decryptNewFile -in $decryptFile
	echo
	echo "'Outputted $decryptFile as $decryptNewFile'"
	echo Remove Old Encrypted File? y/N
	echo
	echo -n
	read decryptOpt
	if [ $decryptOpt = "y" ]
	then
		rm $decryptFile
		echo
		echo ====================
		echo
		home
	fi
	if [ $decryptOpt = "N" ]
	then
		echo
		echo ====================
		echo
		home
	fi
}

home