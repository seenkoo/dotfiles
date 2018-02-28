alias br='brew'
alias brews='br list -1'

alias brc='br cask'
alias bri='br info'
alias brci='brc info'

alias bs='br search'


alias bubo='br update && br outdated'
alias bubc='br upgrade && br cleanup'
alias bubu='bubo && bubc'


alias brs='br services --verbose'

alias brsl='brs list'
alias brss='brs status'

alias bstart='brs start'
alias bstop='brs stop'
alias brestart='brs restart'

alias sbstart='sudo brew services --verbose start'
alias sbstop='sudo brew services --verbose stop'
alias sbrestart='sudo brew services --verbose restart'
