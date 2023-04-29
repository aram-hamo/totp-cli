_totp-cli(){
  local options="help init generate new remove"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=($(compgen -W "$options" -- ${COMP_WORDS[COMP_CWORD]}))

  elif [ "$COMP_CWORD" -eq 2 ]; then
    if ( [ "${COMP_WORDS[1]}" == "generate" ] || [ "${COMP_WORDS[1]}" == "remove" ] ) ; then
      local migrations="`'ls' ~/.local/share/totp-cli/`"
      COMPREPLY=($(compgen -W "$migrations" -- ${COMP_WORDS[2]}))

    fi
  fi
}
complete -F _totp-cli totp-cli
