class Person < ActiveRecord::Base
	has_many :person_interests
	has_many :interests, through: :person_interests, dependent: :destroy
	has_many :reminders, dependent: :destroy
end
