alias nconsole='npm run console'

# Credit goes to
#   https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/node/node.plugin.zsh
function node-docs {
  local section=${1:-all}
  open_command "https://nodejs.org/docs/$(node --version)/api/$section.html"
}
