function stat
  if command -s stat > /dev/null
    echo fish: Unknown command \'stat\'
  else
    if isatty 1
      grc (command -s stat) $argv
    else
      command stat $argv
    end
  end
end
