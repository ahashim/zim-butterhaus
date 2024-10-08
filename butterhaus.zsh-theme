# vim:et sts=2 sw=2 ft=zsh
#
# Butterhaus theme
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

_prompt_basher_pwd() {
  local git_root current_dir

  if git_root=$(command git rev-parse --show-toplevel 2>/dev/null); then
    current_dir="${PWD#${git_root:h}/}"
  else
    current_dir=${(%):-%~}
  fi

  print -n "%F{white}${current_dir}%b"
}

VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '%B%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:clean' format '%F{green} ◍'
  zstyle ':zim:git-info:dirty' format '%F{red} ◍'
  zstyle ':zim:git-info:keys' format 'prompt' ' %F{yellow}%b%c%C%D'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='%(?:%F{green}:%F{red})λ ${VIRTUAL_ENV:+"(${VIRTUAL_ENV:t}) "}%(!:%F{red}:%F{white})%F{blue}%n%f%F:$(_prompt_basher_pwd)${(e)git_info[prompt]}%b '
RPS1='%(?::%F{red}$?)'
