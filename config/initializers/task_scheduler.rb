require 'rubygems'
require 'rake'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every '30s' do
    system 'bundle exec rake reminder_email:send'
end 