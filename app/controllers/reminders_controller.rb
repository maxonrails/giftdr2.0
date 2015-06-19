class RemindersController < ApplicationController
	before_action :find_reminder, only:[:show,:edit,:update,:destroy]
  def index
  	@reminders = Reminder.all
  end

  def show
  end

  def new
  	@reminder = Reminder.new
		@person = Person.new
  end

  def create
  	@reminder = Reminder.new(reminder_params)
		@person = Person.find_or_create_by(name: params[:person][:name])
		@person.reminders << @reminder
  	@reminder.user_id = current_user.id
  	if @reminder.save && @person.save
  		redirect_to reminders_path
  	else
  		render :new
  	end
  end

  def edit
  end


private
	def reminder_params
		params.require(:reminder).permit(:when, :send_text, :send_email, :person_id)
	end
	def person_params
	  params.require(:person).permit(:name)
	end
	def find_reminder
		@reminder = Reminder.find(params[:id])
	end
end
