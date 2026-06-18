# Custom zsh prompt — colors from Hemisu dark (apps/vimlua/colors/hemisu.vim)

setopt prompt_subst transient_rprompt

# Palette (truecolor hex) — customize here
typeset -g PROMPT_CLR_PATH='#9FD3E6'
typeset -g PROMPT_CLR_BRANCH='#BBFFAA'
typeset -g PROMPT_CLR_AHEAD='#777777'
typeset -g PROMPT_CLR_BEHIND='#D65E76'
typeset -g PROMPT_CLR_STAGED='#B1D631'
typeset -g PROMPT_CLR_MODIFIED='#D65E76'
typeset -g PROMPT_CLR_UNTRACKED='#777777'
typeset -g PROMPT_CLR_ARROW='#B1D631'
typeset -g PROMPT_CLR_TIME='#777777'

typeset -g PROMPT_PATH_PARENT_LEN=2

_prompt_path() {
  emulate -L zsh
  local -a parts
  local i seg out="" n

  if [[ $PWD == $HOME ]]; then
    echo -n "%F{${PROMPT_CLR_PATH}}~%f"
    return
  fi

  if [[ $PWD == $HOME/* ]]; then
    parts=("${(@)${(s:/:)${PWD#$HOME/}}}")
    out="~"
  else
    parts=("${(@)${(s:/:)PWD}}")
  fi

  n=$#parts
  for (( i=1; i <= n; i++ )); do
    seg=$parts[i]
    out+="/"
    if (( i == n )); then
      out+=$seg
    else
      out+=${seg[1,$PROMPT_PATH_PARENT_LEN]}
    fi
  done

  echo -n "%F{${PROMPT_CLR_PATH}}${out}%f"
}

_prompt_git() {
  emulate -L zsh
  command -v git >/dev/null || return
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch upstream behind ahead
  local line x y staged=0 unstaged=0 untracked=0
  local out=''

  branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
    || branch=$(git rev-parse --short HEAD 2>/dev/null)

  out+=" %B%F{${PROMPT_CLR_BRANCH}}${branch}%f%b"

  upstream=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
  if [[ -n $upstream ]]; then
    read -r behind ahead < <(git rev-list --left-right --count "${upstream}...HEAD" 2>/dev/null)
    (( behind > 0 )) && out+=" %F{${PROMPT_CLR_BEHIND}}↓${behind}%f"
    (( ahead > 0 ))  && out+=" %F{${PROMPT_CLR_AHEAD}}↑${ahead}%f"
  fi

  while IFS= read -r line; do
    [[ -z $line ]] && continue
    x=$line[1] y=$line[2]
    if [[ $x == '?' && $y == '?' ]]; then
      (( untracked++ ))
    else
      [[ $x != ' ' ]] && (( staged++ ))
      [[ $y != ' ' ]] && (( unstaged++ ))
    fi
  done < <(git status --porcelain 2>/dev/null)

  (( staged > 0 ))    && out+=" %F{${PROMPT_CLR_STAGED}}+${staged}%f"
  (( unstaged > 0 ))  && out+=" %F{${PROMPT_CLR_MODIFIED}}~${unstaged}%f"
  (( untracked > 0 )) && out+=" %F{${PROMPT_CLR_UNTRACKED}}?${untracked}%f"

  echo -n $out
}

_prompt_arrow() {
  echo -n " %F{${PROMPT_CLR_ARROW}}❯%f "
}

_prompt_time() {
  echo -n '%F{'"${PROMPT_CLR_TIME}"'}%D{%H:%M:%S}%f'
}

PROMPT='$(_prompt_path)$(_prompt_git)$(_prompt_arrow)'
RPROMPT='$(_prompt_time)'
