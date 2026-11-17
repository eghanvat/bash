history 	Show history
sudo !! 	Run the previous command with sudo
shopt -s histverify 	Don't execute expanded result immediately

# expansion
!$ 	Expand last parameter of most recent command
!* 	Expand all parameters of most recent command
!-n 	Expand nth most recent command
!n 	Expand nth command in history
!<command> 	Expand most recent invocation of command <command>

# operations
!! 	Execute last command again
!!:s/<FROM>/<TO>/ 	Replace first occurrence of <FROM> to <TO> in most recent command
!!:gs/<FROM>/<TO>/ 	Replace all occurrences of <FROM> to <TO> in most recent command
!$:t 	Expand only basename from last parameter of most recent command
!$:h 	Expand only directory from last parameter of most recent command

!! and !$ can be replaced with any valid expansion.

# slices
!!:n 	Expand only nth token from most recent command (command is 0; first argument is 1)
!^ 	Expand first argument from most recent command
!$ 	Expand last token from most recent command
!!:n-m 	Expand range of tokens from most recent command
!!:n-$ 	Expand nth token to last from most recent command

!! can be replaced with any valid expansion i.e. !cat, !-2, !42, etc.

# cmd history
!!                      # Re-run the previous command

touch foo.sh
chmod +x !$             # Apply executable permissions to the last argument of the previous command (foo.sh)
