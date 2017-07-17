function make
  if command -s make > /dev/null
    echo fish: Unknown command \'make\'
  else
    if isatty 1
      grc (command -s make) $argv
    else
      command make $argv
    end
  end
end
