function mailto -d "Mail to url" --argument-names 'url'
  if _mailto $argv
    i3-msg workspace "2: "
  else
    notify-send -t "mail" "mu4e" "Bad url!"
  end
end

function _mailto -d "Mail to url" --argument-names 'url'
  if test (count $argv) -ne 1
    echo "Usage: $_ <mailto url>"
    return 1
  end
  emacsclient -s mail -eval "(browse-url-mail \"$url\")"
end
