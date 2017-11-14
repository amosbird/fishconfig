# function e --argument-names 'file'
#   if test (count $argv) -ne 1
#     echo "Usage: $_ <filename>"
#     return 1
#   end
#   set max 74994
#   if test -d $file -o -f $file
#     set buf "/"(whoami)"@"(hostname)":"(readlink -f $file)
#     set esc "\033]52;x;"(printf $buf | head -c $max | base64 | tr -d '\r\n')"\a"
#     set esc "\033Ptmux;\033"$esc"\033\\" # tmux
#     printf "$esc"
#   else
#     echo "File $file is not an existing file or directory."
#     return 1
#   end
# end

function e --argument-names 'file'
  if test (count $argv) -ne 1
    echo "Usage: $_ <filename>"
    return 1
  end
  mkdir -p -- (dirname $file)
  touch $file
  emacsclient -n $file
  tmux switch-client -t emacs
end
