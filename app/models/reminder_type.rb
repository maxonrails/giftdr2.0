class ReminderType < ActiveRecord::Base
	has_many :reminders 

  accepts_nested_attributes_for :reminders
end