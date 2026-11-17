# Defining

myfunc() {
    echo "hello $1"
}

# Same as above (alternate syntax)
function myfunc() {
    echo "hello $1"
}

# calling a function
myfunc "John"

# return
myfunc() {
    local myresult='some value'
    echo $myresult
}
myfunc() {
    return 1
}
if myfunc; then
    echo "success"
else
    echo "failure"
fi
