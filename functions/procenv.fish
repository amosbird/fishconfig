function procenv -d "return process env, default self"
  set -l proc %self
  set -q argv[2]; and set proc $argv[2]
  awk -v p="$argv[1]" 'BEGIN {RS="\0"; ORS="\n"} $0 ~ p' /proc/"$proc"/environ;
end
