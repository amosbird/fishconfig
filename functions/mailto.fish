function mailto -d "Mail to url" --argument-names 'url'
  if test (count $argv) -ne 1
    echo "Usage: $_ <mailto url>"
    return 1
  end
  emacsclient -s mail -eval "(ab-url-mail \"$url\")"
end
