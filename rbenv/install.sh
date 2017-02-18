which rbenv >/dev/null 2>&1 || { echo 'rbenv is not installed'; exit 1; }
list=$(rbenv root)/default-gems
test -e $list && exit 0
echo 'bundler
rack
rake
rdoc
yard
rails
powder' > $list
