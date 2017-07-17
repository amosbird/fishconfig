function tune2fs
  if command -s tune2fs > /dev/null
    echo fish: Unknown command \'tune2fs\'
  else
    if isatty 1
      grc (command -s tune2fs) $argv
    else
      command tune2fs $argv
    end
  end
end
