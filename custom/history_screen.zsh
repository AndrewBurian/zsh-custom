# Load the history screening helpers into the hooks
() {

  # ensure the blacklist file exists
  if [[ ! -f ~/.zsh_history_blacklist ]]; then
    touch ~/.zsh_history_blacklist
  fi

  # set the addhistory helper
  if [ -z $zshaddhistory_functions ]; then
    zshaddhistory_functions+=("_historyscreen_blacklist")
    return
  fi

  for helper in $zshaddhistory_functions; do
    if [[ $helper == "_historyscreen_blacklist" ]]; then
      return
    fi
  done

  zshaddhistory_functions+=("_historyscreen_blacklist")
}

_historyscreen_blacklist() {
  if echo $1 | grep -q -f ~/.zsh_history_blacklist; then
    return 1
  fi

  return 0
}
