# Documentation:
# - https://github.com/leandrosardi/gmassbot
#
# Reference:
# - https://www.browserstack.com/guide/selenium-ruby-tutorial
# 

require 'selenium-webdriver'
require 'simple_cloud_logging'
require 'colorize'
require 'pry'

# parameters
keyword = '' #'7300383e-fd42-42e7-aef9-5fe10ee26e1b'

require_relative '../lib/gmassbot.rb'
# require `gmassbot`

l = BlackStack::LocalLogger.new('./test.log')
keyword = "7300383e-fd42-42e7-aef9-5fe10ee26e1b"
results = BlackStack::Bots::GMass.check(keyword, l)
