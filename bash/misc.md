# redirection
python hello.py > output.txt   # stdout to (file)
python hello.py >> output.txt  # stdout to (file), append
python hello.py 2> error.log   # stderr to (file)
python hello.py 2>&1           # stderr to stdout
python hello.py 2>/dev/null    # stderr to (null)
python hello.py &>/dev/null    # stdout and stderr to (null)

# special var
$? 	Exit status of last task
$! 	PID of last background task
$$ 	PID of shell
$0 	Filename of the shell script

# optional arg
args=("$@")
args+=(foo)
args+=(bar)
echo "${args[@]}"

Put the arguments into an array and then append

# strict mode
set -euo pipefail
IFS=$'\n\t'

# reading input
echo -n "Proceed? [y/n]: "
read ans
echo $ans

# getting options
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
    -V | --version )
    echo $version
    exit
    ;;
    -s | --string )
    shift; string=$1
    ;;
    -f | --flag )
    flag=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

# trap errors

trap 'echo Error at about $LINENO' ERR
or
traperr() {
    echo "ERROR: ${BASH_SOURCE[1]} at about ${BASH_LINENO[0]}"
}

set -o errtrace
trap traperr ERR

# sub shells
(cd somedir; echo "I'm now in $PWD")
pwd # still in first directory

# commands
command -V cd
#=> "cd is a function/alias/whatever"

# src, dir
source "${0%/*}/../share/foo.sh"
DIR="${0%/*}"

# printf
printf "Hello %s, I'm %s" Sven Olga
#=> "Hello Sven, I'm Olga
printf "1 + 1 = %d" 2
#=> "1 + 1 = 2"
printf "Print a float: %f" 2
#=> "Print a float: 2.000000"

# Heredoc
cat <<EOF
hello world
EOF

# Herestring
tr '[:lower:]' '[:upper:]' <<< "Will be uppercased, even $variable"
Herestring allows a string to be treated as a standard input (stdin).

