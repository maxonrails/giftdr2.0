class RemindersController < ApplicationController
	before_action :find_reminder, only:[:show,:edit,:update,:destroy] 
  def index
  	@reminders = Reminder.all
  end

  def show
  end

  def new
  	@reminder = Reminder.new 
  	@reminder.build_person
  	@reminder.build_reminder_type
  end

  def create
  	@reminder = Reminder.new(reminder_params)
  	@reminder.user_id = current_user.id
  	if @reminder.save
  		redirect_to reminders_path
  	else
  		render :new
  	end
  end
  def edit
  end 


private
	def reminder_params
		params.require(:reminder).permit(:when, :send_text, :send_email, person_attributes:[:id, :name], reminder_type_attributes:[:event])  
	end 
	def find_reminder
		@reminder = Reminder.find(params[:id])
	end
end 