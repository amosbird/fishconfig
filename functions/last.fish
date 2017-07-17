function last
  if command -s last > /dev/null
    echo fish: Unknown command \'last\'
  else
    if isatty 1
      grc (command -s last) $argv
    else
      command last $argv
    end
  end
end
