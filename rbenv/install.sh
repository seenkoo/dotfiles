which rbenv >/dev/null 2>&1 || { echo 'rbenv is not installed'; exit 1; }
default_gems_file="$(rbenv root)/default-gems"
extended_mri_gems_file="$(rbenv root)/extended-mri-gems"

echo \
'bundler
rack
rake
rdoc
yard
rubygems-update
gem-path
awesome_print
rails
rsense' > $default_gems_file

echo \
'addressable
after_do
axiom-types
bacon
bropages
chronic
coderay
coercible
coffee-script
coffee-script-source
concurrent-ruby
concurrent-ruby-ext
connection_pool
corefines
database_cleaner
did_you_mean
eventmachine
execjs
facets
factory_girl
factory_girl_rails
faker
faraday
fattr
gifme
gist
git
github_api
guard
hashie
highline
http
i18n
imgkit
listen
mail
mimemagic
minitest
multi_json
multi_xml
nokogiri
oauth2
oj
ox
pry
pry-byebug
pry-rails
pry-coolline
pry-toys
puma
pygments.rb
qrencoder
rainbow
require_all
rspec
rspec-rails
rubocop
ruby-progressbar
rubyzip
safe_yaml
sass
sass-rails
shellany
specific_install
streamio-ffmpeg
sqlite3
test-unit
thin
thor
typhoeus
uglifier
url_regex
virtus
webmock
wkhtmltoimage-binary
yajl-ruby' > $extended_mri_gems_file
