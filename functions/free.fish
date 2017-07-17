function free
  if command -s free > /dev/null
    echo fish: Unknown command \'free\'
  else
    if isatty 1
      grc (command -s free) $argv
    else
      command free $argv
    end
  end
end
