# activate zsh-completions
#   https://github.com/zsh-users/zsh-completions
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSH/*) if [ -d $topic_folder ]; then fpath=($topic_folder $fpath); fi;
