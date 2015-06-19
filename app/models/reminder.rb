class Reminder < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  belongs_to :reminder_type  
end
