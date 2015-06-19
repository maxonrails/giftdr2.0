class Person < ActiveRecord::Base
	has_many :person_interests
	has_many :interests, through: :person_interests 
	has_many :reminders
end 