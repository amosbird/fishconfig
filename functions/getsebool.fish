function getsebool
  if command -s getsebool > /dev/null
    echo fish: Unknown command \'getsebool\'
  else
    if isatty 1
      grc (command -s getsebool) $argv
    else
      command getsebool $argv
    end
  end
end
