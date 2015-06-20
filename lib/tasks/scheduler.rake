desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  puts "done."
end

task :send_email => :environment do
  Reminder.all.each do |r|
    puts r.when.change(sec:0)
  end
  @reminders = Reminder.all
  @users = User.all
end
