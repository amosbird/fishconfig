function make
  if type -q make
    echo fish: Unknown command \'make\'
  else
    if isatty 1
      grc (command -s make) $argv
    else
      command make $argv
    end
  end
end
