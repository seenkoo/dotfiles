# Disables Gem deprecation warnings
# @see https://gist.github.com/gmarik/1382974/a3a0216d503b255e7d2d7aa15c3893a9dceed824
begin
  require 'rubygems'
  Gem::Deprecate.skip = true if defined?(Gem::Deprecate)
  module Kernel
    def suppress_warnings
      original_verbosity = $VERBOSE
      $VERBOSE = nil
      result = yield
      $VERBOSE = original_verbosity
      return result
    end
  end
rescue LoadError => e
  p e
end
