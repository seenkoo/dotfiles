FOUND_RBENV=0
for rbenvdir in "/usr/local/opt/rbenv" "$HOME/.rbenv" "/usr/local/rbenv" "/opt/rbenv"; do
  if [ -d $rbenvdir/bin -a $FOUND_RBENV -eq 0 ] ; then
    FOUND_RBENV=1
    if [[ -z "${RBENV_ROOT}" ]]; then
      RBENV_ROOT="${rbenvdir}"
    fi
    export RBENV_ROOT
    export PATH="${rbenvdir}/bin:${PATH}"
    eval "$(rbenv init -)"

    alias rubies="rbenv versions"
    alias current_ruby="rbenv version-name"

    function gems {
      local rbenv_path=$(rbenv prefix)
      gem list $@ | sed -E \
        -e "s/\([0-9a-z, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
        -e "s|$(echo $rbenv_path)|$fg[magenta]\$rbenv_path$reset_color|g" \
        -e "s/$current_ruby@global/$fg[yellow]&$reset_color/g"
    }

    function rbenv_prompt_info() {
      local ver=$(current_ruby)
      local suffix="(rbenv)"
      if [[ "${ver}" == "system" ]]; then
        ver="$(ruby -v | cut -f-2 -d ' ')"
        suffix="(system)"
      fi

      echo "${ver} ${suffix}"
    }
  fi
done
unset rbenvdir

if [ $FOUND_RBENV -eq 0 ] ; then
  alias rubies='ruby -v'
  function rbenv_prompt_info() { echo "system: $(ruby -v | cut -f-2 -d ' ')" }
fi
