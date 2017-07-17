function w
  if command -s w > /dev/null
    echo fish: Unknown command \'w\'
  else
    if isatty 1
      grc (command -s w) $argv
    else
      command w $argv
    end
  end
end
