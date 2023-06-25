# Documentation:
# - https://github.com/leandrosardi/gmassbot
#

require_relative '../lib/gmassbot.rb'
#require 'gmassbot'

l = BlackStack::LocalLogger.new('./example1.log')
keyword = nil
results = BlackStack::Bots::GMass.check(keyword, l)
