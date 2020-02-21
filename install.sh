if [ -z "$ZSH" ]; then
  echo "Must have oh-my-zsh installed"
  exit 1
fi

cp -Rv custom $ZSH
