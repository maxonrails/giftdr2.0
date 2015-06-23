desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  puts "done."
end

task :send_email => :environment do
  User.all.each do |u|
    ReminderMailer.reminder(u).deliver
  end
end
# loop through every user in the database
# for each user, send an email with all reminders that have not been sent.
