# Basics

name="John"
echo "${name}"        # John
echo ${name}    # => John (Variables)
echo $name      # => John (Variables)
echo "$name"    # => John (Variables)
echo '$name'    # => $name (Exact string)
echo "${name}!" # => John! (Variables)
echo $'Hi\nname' # => Hi (next line) name

# slicing
name="John"
echo ${name}           # => John
echo ${name:0:2}       # => Jo
echo ${name::2}        # => Jo
echo ${name::-1}       # => Joh
echo ${name:(-1)}      # => n
echo ${name:(-2)}      # => hn
echo ${name:(-2):2}    # => hn

length=2
echo ${name:0:length}  # => Jo


# Substrings
${foo:0:3}	Substring (position, length)
${foo:(-3):3}	Substring from the right

# Default Values
${foo:-val}	$foo, or val if unset (or null)
${foo:=val}	Set $foo to val if unset (or null)
${foo:+val}	val if $foo is set (and not null)
${foo:?message}	Error if $foo is unset (or null)
echo "${food:-Cake}"  # food, or Cake

# Substitution
${foo%suffix}	Remove shortest suffix
${foo#prefix}	Remove shortest prefix
${foo%%suffix}	Remove longest suffix
${foo/%suffix}	Remove suffix (anchored)
${foo##prefix}	Remove longest prefix
${foo/#prefix}	Remove prefix (anchored)
${foo/from/to}	Replace first match
${foo//from/to}	Replace all
${foo/%from/to}	Replace suffix
${foo/#from/to}	Replace prefix

# path
STR="/path/to/foo.cpp"
echo ${STR%.cpp}    # /path/to/foo
echo ${STR%.cpp}.o  # /path/to/foo.o
echo ${STR%/*}      # /path/to
echo ${STR##*.}     # cpp (extension)
echo ${STR##*/}     # foo.cpp (basepath)
echo ${STR#*/}      # path/to/foo.cpp
echo ${STR##*/}     # foo.cpp
echo ${STR/foo/bar} # /path/to/bar.cpp

base=${src##*/}   # foo.cpp (basename)
dir=${src%$base}  # /path/to/ (dirname)
dir=${src%/*}     # /path/to (dirname)
echo ${SRC%$BASEPATH} # /path/to


# Manipulation
str="HELLO WORLD!"
echo "${str,}"   # hELLO WORLD!
echo "${str,,}"  # hello world!
str="hello world!"
echo "${str^}"   # Hello world!
echo "${str^^}"  # HELLO WORLD!

# Transformations
"${foo@Q}"	Quoted, reusable as input
"${foo@U}"	Uppercase
"${foo@L}"	Lowercase
"${foo@u}"	Uppercase first character
"${foo@E}"	Expand $'…' escapes
"${foo@P}"	Expand as a prompt string
"${foo@A}"	Assignment or declare form
"${foo@a}"	Attribute flags
"${foo[@]@K}"	Quoted key-value pairs
"${foo[@]@k}"	Key-value pairs, split

echo "Welcome To Devhints" | tr '[:lower:]' '[:upper:]'
WELCOME TO DEVHINTS

Options
-c	Operations apply to characters not in the given set
-d	Delete characters
-s	Replaces repeated characters with single occurrence
-t	Truncates
[:upper:]	All upper case letters
[:lower:]	All lower case letters
[:digit:]	All digits
[:space:]	All whitespace
[:alpha:]	All letters
[:alnum:]	All letters and digits

# Prefix name expansion
prefix_a=one
prefix_b=two
echo "${!prefix_*}"  # prefix_a prefix_b

# Indirection
name=joe
pointer=name
echo "${!pointer}"  # => joe

# escape with /

!
"
#
&
'
(
)
,
;
<
>
[
|
\
]
^
{
}
`
$
*
?

# brace expressions
echo {A,B}.js

{A,B} 	Same as A B
{A,B}.js 	Same as A.js B.js
{1..5} 	Same as 1 2 3 4 5
