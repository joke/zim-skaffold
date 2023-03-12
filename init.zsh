(( ${+commands[skaffold]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[skaffold]:-"$(${commands[asdf]} which skaffold 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_skaffold
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'skaffold'. Regenerated completions."
  fi
} ${0:h}
