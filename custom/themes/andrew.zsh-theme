# fino.zsh-theme

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  #echo '○'
  echo '→'
}

local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'
local cluster_info='$(kcurrent)'

PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%} %{$FG[239]%}targeting%{$FG[239]%} %{$FG[033]%}${cluster_info}%{$reset_color%}${git_info} 
╰─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
