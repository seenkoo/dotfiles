# -----------------------------------------------------------------------------
# `rails` command
# -----------------------------------------------------------------------------
function _rails_command () {
  if [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    command rails $@
  fi
}
alias rails='_rails_command'
#compdef _rails_command=rails
# -----------------------------------------------------------------------------
# Rails aliases
# -----------------------------------------------------------------------------
alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rp='rails plugin'
alias ru='rails runner'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rsp='rails server --port'
alias rsr='touch ./tmp/restart.txt'
# -----------------------------------------------------------------------------
# Rails environment
# -----------------------------------------------------------------------------
alias -g RAILSDEV='RAILS_ENV=development'
alias -g RAILSPROD='RAILS_ENV=production'
alias -g RAILSTEST='RAILS_ENV=test'
# -----------------------------------------------------------------------------
# Rails logs
# -----------------------------------------------------------------------------
if type 'grc' > /dev/null; then
  logViewer='grc tail -f'
else
  logViewer='tail -f'
fi
alias devlog="${logViewer} log/development.log"
alias prodlog="${logViewer} log/production.log"
alias testlog="${logViewer} log/test.log"
alias sidekiqlog="${logViewer} log/sidekiq.log"
unset logViewer
# -----------------------------------------------------------------------------
# Rake aliases
# -----------------------------------------------------------------------------
alias rdm='rake db:migrate'
alias rdms='rake db:migrate:status'
alias rdr='rake db:rollback'
alias rdc='rake db:create'
alias rds='rake db:seed'
alias rdd='rake db:drop'
alias rdrs='rake db:reset'
alias rdtc='rake db:test:clone'
alias rdtp='rake db:test:prepare'
alias rdmtc='rake db:migrate db:test:clone'
alias rdsl='rake db:schema:load'
alias rlc='rake log:clear'
alias rn='rake notes'
alias rr='rake routes'
alias rrg='rake routes | grep'
alias rt='rake test'
alias rmdw='rake middleware'
alias rsts='rake stats'
# -----------------------------------------------------------------------------
# Puma aliases
# -----------------------------------------------------------------------------
alias puma-ssl="puma -b 'ssl://127.0.0.1:8443?key=/Users/seenkoo/.ssh/local.dev.key&cert=/Users/seenkoo/.ssh/local.dev.crt'"
