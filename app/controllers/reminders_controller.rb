class RemindersController < ApplicationController
	before_action :find_reminder, only:[:show,:edit,:update,:destroy]
	before_action :logged_in?, only:[:index,:edit,:new,:destroy]

  def index
  	@reminders = Reminder.order(:when)
		@reminder = Reminder.new
		@person = Person.new
		@reminder_type = ReminderType.new
		@interest = Interest.new
  end

  def show
  end

  def new
  	# @reminder = Reminder.new
		# @person = Person.new
		# @reminder_type = ReminderType.new
		# @interest = Interest.new
  end

  def create
  	@reminder = Reminder.new(reminder_params)
		@person = Person.find_or_create_by(name: params[:person][:name])
		@reminder_type = ReminderType.find_or_create_by(event:params[:reminder_type][:event])
		@interest = Interest.find_or_create_by(name:params[:interest][:name])

		@person.reminders << @reminder
		@person.interests << @interest if @interest.name != ""
		@reminder_type.reminders << @reminder

  	@reminder.user_id = current_user.id
		@reminder.sent = false

  	if @reminder.save && @person.save && @reminder_type.save
  		redirect_to reminders_path
  	else
			render :new
  	end
  end

  def edit
  end

	def destroy
	  if @reminder.destroy
	  	redirect_to reminders_path
	  end
	end

  def etsy

  end

  def amazon_api
    @keyword = params[:search]

    request = Vacuum.new('US')
    request.configure(
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      associate_tag: ENV['associate_tag']
      )

    params = {
        'SearchIndex' => 'All',
        'Keywords'=> @keyword,
        'ResponseGroup' => "ItemAttributes,Images"
      }

      ## DEFINES THE REQUEST RETURN
      raw_products = request.item_search(query: params)
      hashed_products = raw_products.to_h
      ## PUTS SPECIFICS OF HASHED SEARCH RESPONSE INTO AN ARRAY
      @products = hashed_products['ItemSearchResponse']['Items']['Item']
  end

private
	def reminder_params
		params.require(:reminder).permit(:when, :send_text, :send_email, :person_id)
	end
	def find_reminder
		@reminder = Reminder.find(params[:id])
	end
end
