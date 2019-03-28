require 'rubygems'
require 'rake'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
job = scheduler.every ("30s") do
    system 'rake reminder_email:send'
end 
