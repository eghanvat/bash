##Comment

# This is an inline Bash comment.

: '
This is a
very neat comment
in bash
'

##Variable

name="John"
echo ${name}    # => John (Variables)
echo $name      # => John (Variables)
echo "$name"    # => John (Variables)
echo '$name'    # => $name (Exact string)
echo "${name}!" # => John! (Variables)
name = "John"   # => Error (about space)
