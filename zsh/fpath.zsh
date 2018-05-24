fpath=("$ZSH/functions" "$(brew --prefix)/share/zsh-completions" $fpath)

for topic_dir ($ZSH/*/completions) if [ -d $topic_dir ]; then fpath=($topic_dir $fpath); fi;
