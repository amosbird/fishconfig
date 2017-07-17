function nmap
  if command -s nmap > /dev/null
    echo fish: Unknown command \'nmap\'
  else
    if isatty 1
      grc (command -s nmap) $argv
    else
      command nmap $argv
    end
  end
end
