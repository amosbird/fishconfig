function iostat
  if type -q iostat
    echo fish: Unknown command \'iostat\'
  else
    if isatty 1
      grc (command -s iostat) $argv
    else
      command iostat $argv
    end
  end
end
