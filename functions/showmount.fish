function showmount
  if type -q showmount
    echo fish: Unknown command \'showmount\'
  else
    if isatty 1
      grc (command -s showmount) $argv
    else
      command showmount $argv
    end
  end
end
