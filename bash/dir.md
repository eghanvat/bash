
# moving
pwd                             # Print the current directory path
ls                              # List directories
ls -a|--all                     # List all directories, including hidden ones
ls -l                           # List directories in long format
ls -l -h|--human-readable       # List directories in long format with human-readable sizes
ls -t                           # List directories by modification time, with newest first
stat foo.txt                    # Display size, creation, and modification timestamps for a file
stat foo                        # Display size, creation, and modification timestamps for a directory
tree                            # Display directory and file tree
tree -a                         # Display directory and file tree, including hidden entries
tree -d                         # Display directory tree
cd foo                          # Change directory to 'foo'
cd                              # Change directory to home directory
cd ~                            # Change directory to home directory
cd -                            # Change directory to the last visited directory
pushd foo                       # Change directory to 'foo' and add the previous directory to the directory stack
popd                            # Return to the directory saved by the last 'pushd' command

# creating
mkdir foo                                # Create a directory named 'foo'
mkdir foo bar                            # Create multiple directories
mkdir -p|--parents foo/bar               # Create a nested directory
mkdir -p|--parents {foo,bar}/baz         # Create multiple nested directories

mktemp -d|--directory                    # Create a temporary directory

# moving
cp -R|--recursive foo bar                                       # Copy directory 'foo' to 'bar'
mv foo bar                                                      # Move directory 'foo' to 'bar'

rsync -z|--compress -v|--verbose /foo /bar                      # Copy directory, overwriting destination
rsync -a|--archive -z|--compress -v|--verbose /foo /bar         # Copy directory, without overwriting destination
rsync -avz /foo username@hostname:/bar                          # Copy local directory to remote directory
rsync -avz username@hostname:/foo /bar                          # Copy remote directory to local directory

# deleting
rmdir foo                               # Delete empty directory 'foo'
rm -r|--recursive foo                   # Delete directory 'foo' and its contents
rm -r|--recursive -f|--force foo        # Delete directory 'foo' and its contents, ignoring nonexistent files and never prompting

# creating files
touch foo.txt                           # Create or update file 'foo.txt'
touch foo.txt bar.txt                   # Create multiple files
touch {foo,bar}.txt                     # Create multiple files
touch test{1..3}                        # Create test1, test2, and test3 files
touch test{a..c}                        # Create testa, testb, and testc files

mktemp                                  # Create a temporary file

# reading files
cat foo.txt             # Print all contents
less foo.txt            # View contents paginated (g - go to top, SHIFT+g - go to bottom, /foo - search for 'foo')
head foo.txt            # Display top 10 lines of the file
tail foo.txt            # Display bottom 10 lines of the file
open foo.txt            # Open file in the default editor
wc foo.txt              # Count lines, words, and characters in the file

# moving files
cp foo.txt bar.txt                                 # Copy file 'foo.txt' to 'bar.txt'
mv foo.txt bar.txt                                 # Move file 'foo.txt' to 'bar.txt'
rsync -z|--compress -v|--verbose /foo.txt /bar     # Copy file quickly if it's changed
rsync z|--compress -v|--verbose /foo.txt /bar.txt  # Copy and rename file quickly if it's changed

# deleting files
rm foo.txt              # Delete file 'foo.txt'
rm -f|--force foo.txt   # Delete file 'foo.txt', ignore nonexistent files, and never prompt

# permissions
# 	Permission 	rwx 	Binary
7 	read, write, and execute 	rwx 	111
6 	read and write 	rw- 	110
5 	read and execute 	r-x 	101
4 	read only 	r-- 	100
3 	write and execute 	-wx 	011
2 	write only 	-w- 	010
1 	execute only 	--x 	001
0 	none 	--- 	000

ls -l /foo.sh           # List file permissions
chmod +100 foo.sh       # Add execute permission for the user
chmod -100 foo.sh       # Remove execute permission for the user
chmod u+x foo.sh        # Grant execute permission to the user
chmod g+x foo.sh        # Grant execute permission to the group
chmod u-x,g-x foo.sh    # Revoke execute permission from the user and group
chmod u+x,g+x,o+x foo.sh # Grant execute permission to everyone
chmod a+x foo.sh        # Grant execute permission to everyone
chmod +x foo.sh         # Grant execute permission to everyone

# standard i/o/e
echo "foo" > bar.txt        # Overwrite file 'bar.txt' with content
echo "foo" >> bar.txt       # Append content to file 'bar.txt'
ls exists 1> stdout.txt     # Redirect standard output to a file
ls noexist 2> stderror.txt  # Redirect standard error output to a file
ls 2>&1 > out.txt           # Redirect standard output and error to a file
ls > /dev/null              # Discard standard output and error
read foo                    # Read from standard input and assign to variable 'foo'

# finding files
## binary
type wget                   # Find the binary
which wget                  # Find the binary
whereis wget                # Find the binary, source, and manual page files

## locate, uses index and is fast
updatedb                    # Update the index
locate foo.txt              # Find a file
locate --ignore-case foo.txt # Find a file and ignore case
locate f*.txt               # Find text files starting with 'f'

## find
find /path -name foo.txt                  # Find a file
find /path -iname foo.txt                 # Find a file with case-insensitive search
find /path -name "*.txt"                  # Find all text files
find /path -name foo.txt -delete          # Find a file and delete it
find /path -name "*.png" -exec pngquant {} # Find and execute pngquant on all .png files
find /path -type f -name foo.txt          # Find a file
find /path -type d -name foo              # Find a directory
find /path -type l -name foo.txt          # Find a symbolic link
find /path -type f -mtime +30             # Find files not modified in 30 days
find /path -type f -mtime +30 -delete     # Delete files not modified in 30 days

## find in files
grep 'foo' /bar.txt                        # Search for 'foo' in file 'bar.txt'
grep 'foo' /bar -r|--recursive             # Search for 'foo' in directory 'bar'
grep 'foo' /bar -R|--dereference-recursive # Search for 'foo' in directory 'bar' and follow symbolic links
grep 'foo' /bar -l|--files-with-matches    # Show files that match
grep 'foo' /bar -L|--files-without-match   # Show files that don't match
grep 'Foo' /bar -i|--ignore-case           # Case-insensitive search
grep 'foo' /bar -x|--line-regexp           # Match the entire line
grep 'foo' /bar -C|--context 1             # Add N lines of context above and below each search result
grep 'foo' /bar -v|--invert-match          # Show lines that don't match
grep 'foo' /bar -c|--count                 # Count lines that match
grep 'foo' /bar -n|--line-number           # Add line numbers
grep 'foo' /bar --colour                   # Add color to output
grep 'foo\|bar' /baz -R                    # Search for 'foo' or 'bar' in directory 'baz'
grep --extended-regexp|-E 'foo|bar' /baz -R# Use regular expressions
egrep 'foo|bar' /baz -R                    # Use regular expressions

## replace in files
sed 's/fox/bear/g' foo.txt               # Replace 'fox' with 'bear' in foo.txt and display to console
sed 's/fox/bear/gi' foo.txt              # Replace 'fox' (case insensitive) with 'bear' in foo.txt and display to console
sed 's/red fox/blue bear/g' foo.txt      # Replace 'red' with 'blue' and 'fox' with 'bear' in foo.txt and display to console
sed 's/fox/bear/g' foo.txt > bar.txt     # Replace 'fox' with 'bear' in foo.txt and save to bar.txt
sed 's/fox/bear/g' foo.txt -i|--in-place # Replace 'fox' with 'bear' in foo.txt and overwrite foo.txt

# compressing files
## zip
zip foo.zip /bar.txt                # Compress bar.txt into foo.zip
zip foo.zip /bar.txt /baz.txt       # Compress bar.txt and baz.txt into foo.zip
zip foo.zip /{bar,baz}.txt          # Compress bar.txt and baz.txt into foo.zip
zip -r|--recurse-paths foo.zip /bar # Compress directory bar into foo.zip

## gzip
gzip /bar.txt foo.gz           # Compress bar.txt into foo.gz and then delete bar.txt
gzip -k|--keep /bar.txt foo.gz # Compress bar.txt into foo.gz

## tar -c
tar -c|--create -z|--gzip -f|--file=foo.tgz /bar.txt /baz.txt # Compress bar.txt and baz.txt into foo.tgz
tar -c|--create -z|--gzip -f|--file=foo.tgz /{bar,baz}.txt    # Compress bar.txt and baz.txt into foo.tgz
tar -c|--create -z|--gzip -f|--file=foo.tgz /bar              # Compress directory bar into foo.tgz

# decompressing files
unzip foo.zip          # Unzip foo.zip into the current directory
gunzip foo.gz           # Unzip foo.gz into the current directory and delete foo.gz
gunzip -k|--keep foo.gz # Unzip foo.gz into the current directory
tar -x|--extract -z|--gzip -f|--file=foo.tar.gz # Un-compress foo.tar.gz into the current directory
tar -x|--extract -f|--file=foo.tar              # Un-combine foo.tar into the current directory
