function rm
  if test (count $argv) -lt 1
    echo "Usage: $_ <filename|dir>*"
    return 1
  end
  mv $argv ~/.trash
end
