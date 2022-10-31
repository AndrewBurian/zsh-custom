rfc() {
	local filepath=${RFC_PATH:-~/Documents/rfcs}
	local aliaspath=${RFC_ALIAS_PATH:-~/.rfc/alias}
	local file=

	if [[ $# != 1 ]]; then
		echo "use: rfc <num>"
		return
	fi

	if [[ -e $filepath/rfc$1.txt ]]; then
		file=$filepath/rfc$1.txt
	elif [[ -h $aliaspath/$1 ]]; then
		file=$aliaspath/$1
	fi

	if [[ "$file" == "" ]]; then

		if [[ ! "$1" =~ "[0-9]{3,4}" ]]; then
			echo "No alias found, cannot download non-id name $1"
			return
		fi
		echo "Downloading RFC $1"
		curl https://www.rfc-editor.org/rfc/rfc$1.txt --output-dir $filepath -O --create-dirs --no-progress-meter
		if [[ $? != 0 ]]; then
			echo "Error downloading"
			return
		fi
		file=$filepath/rfc$1.txt
	fi

	less -z 56 $file
}

rfcname() {

	local filepath=${RFC_PATH:-~/Documents/rfcs}
	local aliaspath=${RFC_ALIAS_PATH:-~/.rfc/alias}

	if [[ $# < 2 ]]; then
		echo "use: rfcname <id> <name>"
		return
	fi

	if [[ ! -e $filepath/rfc$1.txt ]]; then
		echo "RFC $1 not downloaded, get it first"
		return
	fi

	if [[ -h $aliaspath/$2 || -e $filepath/$2.txt ]]; then
		echo "alias $2 is taken"
		return
	fi

	if [[ ! -d $aliaspath ]]; then
		mkdir -p $aliaspath
	fi

	ln -s $filepath/rfc$1.txt $aliaspath/$2
}

rfcls() {
	local aliaspath=${RFC_ALIAS_PATH:-~/.rfc/alias}	

	ls $@ $aliaspath
}
