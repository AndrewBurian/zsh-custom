# Load the history screening helpers into the hooks
() {

  # ensure the blacklist file exists
  if [[ ! -f ~/.zsh_history_redact_patterns ]]; then
    touch ~/.zsh_history_redact_patterns
  fi

  # set the addhistory helper
  if [ -z $zshaddhistory_functions ]; then
    zshaddhistory_functions=()
  fi

  for helper in $zshaddhistory_functions; do
    if [[ $helper == "_historyscreen__redact_patterns" ]]; then
      return
    fi
  done

  zshaddhistory_functions+=("_history_redact_patterns")
}

_history_redact_patterns() {
  if echo $1 | grep -q -f ~/.zsh_history_redact_patterns; then
    return 1
  fi

  return 0
}
