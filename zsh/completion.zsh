# http://superuser.com/a/815317
#
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
#
# See:
# - matcher-list in zshcompsys(1)
# - COMPLETION MATCHING CONTROL in zshcompwid(1)
# - FILENAME GENERATION in zshexpn(1)
zstyle ':completion:*' matcher-list                                      \
       ''                                                                \
       '                                   m:{[:lower:]\-}={[:upper:]_}' \
       'r:[^[:alpha]]||[[:alpha]]=** r:|=* m:{[:lower:]\-}={[:upper:]_}'
      #  'r:|?=**                            m:{[:lower:]\-}={[:upper:]_}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

#
zstyle ':completion:*' sort false

# load zsh-autosuggestions
#   https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# load zsh-syntax-highlighting
#   https://github.com/zsh-users/zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
