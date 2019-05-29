# frozen_string_literal: true

##
# A simple wrapper around `ENV` that makes working with environment variables a
# bit cleaner.
#
# @example Getting a variable
#   Getenv.HOME #=> "/Users/erlend"
#   Getenv.LANG #=> "en_US.UTF-8"
#
# @example Setting a variable
#   Getenv.LANG = "nb_NO.UTF-8" #=> "nb_NO.UTF-8"
#   Getenv.LANG                 #=> "nb_NO.UTF-8"
#
# @example Check if a variable is set
#   Getenv.LANG?   #=> true
#   Getenv.NOTHING #=> false
#
# @example Getting a variable or raise error if missing
#   Getenv.LANG!    #=> "en_US.UTF-8"
#   Getenv.NOTHING! #=> raises Getenv::Error (key not found `NOTHING`)
module Getenv
  class Error < StandardError; end

  class << self
    def method_missing(meth, value = nil)
      key = meth.to_s
      suffix = key[-1]
      key = key[0..-2] if %w[? = !].include?(suffix)

      case suffix
      when '?' then ENV.key?(key)
      when '=' then ENV[key] = value
      when '!' then ENV.fetch(key) { raise Error, "key not found `#{key}`" }
      else
        key ? ENV[key] : super
      end
    end

    ##
    # Make {#respond_to?} always return true
    def respond_to_missing?(*)
      true
    end
  end
end
