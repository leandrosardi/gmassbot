![Gem version](https://img.shields.io/gem/v/gmassbot) ![Gem downloads](https://img.shields.io/gem/dt/gmassbot)

# GMassBot

Ruby bot for automating opearions on [GMass Deliverability Test and Spam Checker](https://www.gmass.co/inbox).

## 1. Getting Started

1. Install **GMassBot** gem.

```bash
gem install gmassbot
```

2. Send a Test Email

Send an email to one or more of these addresses:

```
ajay.silicomm@gmail.com, ajaygoel999@gmail.com, ajay@parttimesnob.com, test@chromecompete.com, test@ajaygoel.org, me@dropboxslideshow.com, test@wordzen.com, rajgoel8477@gmail.com, briansmith8477@gmail.com, ajay@madsciencekidz.com, ajay2@ctopowered.com, ajay@arena.tec.br, ajay@smallbizdevgroup.com
```

Do it manually, or by code.

3. Check Where Your Email Landed

Getting the status of the "test" job.

```ruby
require `gmassbot`
keyword = "<your email address here>"
results = BlackStack::Bots::GMass.check(keyword)
```

## 2. Permanent Browser

The **GMassBot** uses Chrome for accessing GMass website.

By defauly, **GMassBot** creates and close a Chrome browser each time you call the `check` method.

If you are going to run many checks, you can initialize a permanent browser, and get **GMassBot** always working in the same browser.

```ruby
require `gmassbot`
keyword = "<your email address here>"
BlackStack::Bots::GMass.init # start a Chrome browser
results = BlackStack::Bots::GMass.check(keyword)
BlackStack::Bots::GMass.finalize # close the Chrome browser
```

## 3. Logging

This [GMassBot](https://github.com/leandrosardi/gmassbot) is integrated with [Simple Cloud Logging](https://github.com/leandrosardi/simple_cloud_logging), for tracking all methods internal activity.

```ruby
require `gmassbot`
l = BlackStack::LocalLogger.new('./test.log')
keyword = "<your email address here>"
results = BlackStack::Bots::GMass.check(keyword, l)
```

## Disclaimer

Use this gem at your own risk.