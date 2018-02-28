if [ -d "$ZSH/ruby/lib" ]; then
  export RUBYLIB="$ZSH/ruby/lib$RUBYLIB"
  export RUBYOPT="-rno_deprecation_warnings_kthxbye"
fi
