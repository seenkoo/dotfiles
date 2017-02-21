brew_cask_upgrade() {
  brew_cask_outdated --verbose | while read cask versions; do
    echo "$cask $versions"
    (set -x; brew cask install $cask --force;)
  done
}

brew_cask_outdated() {
  local verbose=$(( ${@[(i)--verbose]} <= $# ))
  local -A casks=(${(fz)$(brew cask list --versions | sed -E "s/ (.*)/ '\1'/")})
  local -a cask_list=(${(ok)casks})
  integer idx=1
  local current=$cask_list[$idx]
  local -a outdated=( )

  brew cask info $cask_list | while read line; do
    if [[ ${(w)#line} -eq 2 && "$line" = "${current}: "* ]]; then
      local version=${${=line}[2]}
      local installed=$casks[$current]
      if [[ "$installed" != *"$version"* ]]; then
        if (( $verbose )); then
          outdated+="$current ($version) > (${(Q)installed})"
        else
          outdated+="$current"
        fi
      fi
      idx+=1
      current=$cask_list[$idx]
    fi
  done

  if [[ -n "$outdated" ]]; then
    print -l $outdated
  fi
}

brew_cask_cleanup_old_versions() {
  local caskroom_path="$(brew --prefix)/Caskroom"
  brew cask list --versions | while read cask versions ; do
    versions=(${=versions})
    if [[ $versions[(I)$versions[-1]] > 1 ]]; then
      for version in $versions[1,-2] ; do
        local paths="'$caskroom_path/$cask/$version' '$caskroom_path/$cask/.metadata/$version'"
        rm -rf "$paths"
        echo "Removed $paths"
      done
    fi
  done
}
