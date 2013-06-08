export LS_COLORS="ow=01;33:di=01;33"
export GREP_OPTIONS="--color=auto"

function git_status {
  status="$(git status 2> /dev/null | cat)"

  pattern="Changes"
  [[ "$status" =~ "$pattern" ]] && echo "!"

  pattern="untracked files"
  [[ "$status" =~ "$pattern" ]] && echo "*"
}

export PS1="\u@\h[\w]\$(__git_ps1 '[%s'\$(git_status)']')"

