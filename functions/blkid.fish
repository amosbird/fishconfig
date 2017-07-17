function blkid
  if command -s blkid > /dev/null
    echo fish: Unknown command \'blkid\'
  else
    if isatty 1
      grc (command -s blkid) $argv
    else
      command blkid $argv
    end
  end
end
