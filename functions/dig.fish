function dig
  if command -s dig > /dev/null
    echo fish: Unknown command \'dig\'
  else
    if isatty 1
      grc (command -s dig) $argv
    else
      command dig $argv
    end
  end
end
