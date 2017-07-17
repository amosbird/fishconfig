function getfacl
  if command -s getfacl > /dev/null
    echo fish: Unknown command \'getfacl\'
  else
    if isatty 1
      grc (command -s getfacl) $argv
    else
      command getfacl $argv
    end
  end
end
