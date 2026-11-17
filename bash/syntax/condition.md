# Conditions

* [[ is a shell keyword returning 0 (true) or 1 (false); any command with that exit-status logic works too.


# Integers
[[ NUM -eq NUM ]] 	Equal
[[ NUM -ne NUM ]] 	Not equal
[[ NUM -lt NUM ]] 	Less than
[[ NUM -le NUM ]] 	Less than or equal
[[ NUM -gt NUM ]] 	Greater than
[[ NUM -ge NUM ]] 	Greater than or equal
(( NUM < NUM )) 	Less than
(( NUM <= NUM )) 	Less than or equal
(( NUM > NUM )) 	Greater than
(( NUM >= NUM )) 	Greater than or equal


# Strings
[[ -z STR ]] 	Empty string
[[ -n STR ]] 	Not empty string
[[ STR == STR ]] 	Equal
[[ STR = STR ]] 	Equal (Same above)
[[ STR < STR ]] 	Less than (ASCII)
[[ STR > STR ]] 	Greater than (ASCII)
[[ STR != STR ]] 	Not Equal
[[ STR =~ STR ]] 	Regexp


# More conditions
[[ -o noclobber ]]	If OPTIONNAME is enabled
[[ -v VAR ]]	Variable is set
[[ ! EXPR ]]	Not
[[ X && Y ]]	And
[[ X || Y ]]	Or

# File conditions
[[ -e FILE ]]	Exists
[[ -r FILE ]]	Readable
[[ -h FILE ]]	Symlink
[[ -d FILE ]]	Directory
[[ -w FILE ]]	Writable
[[ -s FILE ]]	Size is > 0 bytes
[[ -f FILE ]]	File
[[ -x FILE ]]	Executable
[[ FILE1 -nt FILE2 ]]	1 is more recent than 2
[[ FILE1 -ot FILE2 ]]	2 is more recent than 1
[[ FILE1 -ef FILE2 ]]	Same file (inode)

# logical and, or
if [ "$1" = 'y' -a $2 -gt 0 ]; then
    echo "yes"
fi

if [ "$1" = 'n' -o $2 -lt 0 ]; then
    echo "no"
fi

