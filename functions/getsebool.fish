function getsebool
  if type -q getsebool
    echo fish: Unknown command \'getsebool\'
  else
    if isatty 1
      grc (command -s getsebool) $argv
    else
      command getsebool $argv
    end
  end
end
