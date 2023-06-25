require 'selenium-webdriver'
require 'simple_cloud_logging'
require 'colorize'
require 'pry'

module BlackStack
    module Bots
        class GMass
            TEST_ADDRESSES = 'ajay.silicomm@gmail.com, ajaygoel999@gmail.com, ajay@parttimesnob.com, test@chromecompete.com, test@ajaygoel.org, me@dropboxslideshow.com, test@wordzen.com, rajgoel8477@gmail.com, briansmith8477@gmail.com, ajay@madsciencekidz.com, ajay2@ctopowered.com, ajay@arena.tec.br, ajay@smallbizdevgroup.com'.split(', ').map(&:strip)

            @@permanent_driver = nil

            def self.init(l=nil)
                l = BlackStack::DummyLogger.new(nil) if l.nil?

                raise 'Driver already exists' if @@permanent_driver != nil

                l.logs 'Starting chrome... '
                @@permanent_driver = Selenium::WebDriver.for :chrome
                l.done

                @@permanent_driver
            end

            def self.finalize(l=nil)
                l = BlackStack::DummyLogger.new(nil) if l.nil?

                raise 'Driver not exists' if @@permanent_driver.nil?

                l.logs 'Finalizing chrome... '
                @@permanent_driver.quit
                l.done
            end

            def self.check(keyword, l=nil)
                keyword = keyword.to_s

                l = BlackStack::DummyLogger.new(nil) if l.nil?
                res = []
                using_permanent_driver = (@@permanent_driver != nil)
                
                l.logs 'Checking driver... '
                driver = @@permanent_driver if using_permanent_driver
                driver = self.init(l) unless using_permanent_driver
                l.done
                
                l.logs 'Starting chrome... '
                driver.navigate.to "https://www.gmass.co/inbox?q=#{keyword}"
                l.done
                
                l.logs "Creating wait object... "
                wait = Selenium::WebDriver::Wait.new(:timeout => 10)
                l.done
                
                l.logs 'Getting results... '
                divs = driver.find_elements(:class, "table-wrap")
                l.logf divs.size.to_s.green
                
                i = 0
                divs.each { |div|
                    i += 1
                    l.log ''
                    l.logs "#{i}... "
                    table = div.find_element(:class, "result-table")
                    tr = table.find_elements(:tag_name, "tr").first
                    td = tr.find_elements(:tag_name=>"td", :class=>'card-address').first
                    test_name = td.text.gsub("\n", ' - ').gsub("\r", ' - ').strip
                    l.logf test_name.blue
                
                    # wait until a second td appears
                    l.logs 'Loading result... '
                    lis = tr.find_elements(:tag_name=>"li")
                    begin
                        wait.until { lis.size > 0 }
                        l.logf lis.size.to_s.green
                
                        # get the first li
                        l.logs 'Getting first li... '
                        li = lis.first
                        l.done
                
                        # get the .from span
                        l.logs 'Getting from span... '
                        from = li.find_element(:class, "from").text
                        l.logf from.blue
                
                        # get the time and result
                        l.logs 'Getting time and result... '
                        time = li.find_element(:class, "time").text
                        l.logf time.blue
                
                        l.logs 'Getting result... '
                        result = li.find_element(:class=>'result-label').text
                        l.logf result.to_s.upcase == 'Spam'.upcase ? result.red : result.green
                
                        res << {
                            :test_name => test_name,
                            :from => from,
                            :time => time,
                            :result => result
                        }

                    rescue Selenium::WebDriver::Error::TimeoutError => e
                        l.logf '0'.red
                        res << {
                            :test_name => test_name,
                            :from => nil,
                            :time => nil,
                            :result => nil
                        }
                    end
                }
                
                l.logs 'Closing chrome... '
                unless using_permanent_driver             
                    driver.quit
                    l.done
                else
                    l.no
                end

                res
            end # def self.check       

        end # class GMass
    end # module Bots
end