function fish_right_prompt
  function last_job_id -d "Get the id of one or more existing jobs"
    builtin jobs $argv | command awk -v FS=\t '
    /[0-9]+\t/{
    aJobs[++nJobs] = $1
    }
  END {
  for (i = 1; i <= nJobs; i++) {
    print(aJobs[i])
    }

    exit nJobs == 0
    }
    '
  end
  function humanize_duration -d "Humanize a time interval for display"
      command awk '
          function hmTime(time,   stamp) {
              split("h:m:s:ms", units, ":")
  
              for (i = 2; i >= -1; i--) {
                  if (t = int( i < 0 ? time % 1000 : time / (60 ^ i * 1000) % 60 )) {
                      stamp = stamp t units[sqrt((i - 2) ^ 2) + 1] " "
                  }
              }
              if (stamp ~ /^ *$/) {
                  return "0ms"
              }
              return substr(stamp, 1, length(stamp) - 1)
          }
          { 
              print hmTime($0) 
          }
      '
  end
  set -l status_copy $status
  set -l status_code $status_copy

  set -l color_normal (set_color normal)
  set -l color_error (set_color $fish_color_error)
  set -l color "$color_normal"

  switch "$status_copy"
      case 0 "$__boss_status_last"
          set status_code
  end

  set -g __boss_status_last $status_copy

  if test "$status_copy" -ne 0
      set color "$color_error"
  end

  if set -l job_id (last_job_id)
      echo -sn "$color(%$job_id)$color_normal "
  end

  if test ! -z "$status_code"
      echo -sn "$color($status_code)$color_normal "
  end

  if test "$CMD_DURATION" -gt 250
      set -l duration (echo $CMD_DURATION | humanize_duration)
      echo -sn "$color($duration)$color_normal "
  end
end
