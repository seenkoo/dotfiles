which rbenv >/dev/null 2>&1 || { echo 'rbenv is not installed'; exit 1; }
list=/usr/local/opt/rbenv/default-gems
test -e $list && exit 0
echo 'bundler
rack
rake
rdoc
yard
rails
' > $list
