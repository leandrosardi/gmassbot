# Documentation:
# - https://github.com/leandrosardi/gmassbot
#
# Reference:
# - https://www.browserstack.com/guide/selenium-ruby-tutorial
# 

require_relative '../lib/gmassbot.rb'
# require `gmassbot`

l = BlackStack::LocalLogger.new('./test.log')
keyword = nil
results = BlackStack::Bots::GMass.check(keyword, l)
