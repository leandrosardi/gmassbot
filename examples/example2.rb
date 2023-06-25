# Documentation:
# - https://github.com/leandrosardi/gmassbot
#

#require_relative '../lib/gmassbot.rb'
require 'gmassbot'

begin
    l = BlackStack::LocalLogger.new('./example2.log')
    keyword = nil

    BlackStack::Bots::GMass.init(l)
    while true
        results = BlackStack::Bots::GMass.check(keyword, l)

        l.log 'Sleep... '
        sleep 10
        l.done
    end

    BlackStack::Bots::GMass.finalize(l)

# catch any Exception object
rescue => e
    l.logf e.to_s.red
    BlackStack::Bots::GMass.finalize(l)
    exit(1)

# catch any Selenium timeout error
rescue Selenium::WebDriver::Error::TimeoutError => e
    l.logf e.to_s.red
    BlackStack::Bots::GMass.finalize(l)
    exit(1)

# catch if user press CTRL+C
rescue Interrupt => e
    l.logf e.to_s.red
    BlackStack::Bots::GMass.finalize(l)
    exit(1)

end