class PersonsController < ApplicationController
  before_action :find_person, only:[:show, :create,:update]
  def index
    @persons = Person.all
  end

  def show
    @interest = Interest.new
  end
  
  def update
    @interest = Interest.find_or_create_by(interest_params)
    @person.interests << @interest
    if @interest.save
      redirect_to person_path(@person.id)
    end
  end

  def new
  end

  def edit
  end
private
  def interest_params
    params.require(:interest).permit(:name)
  end
  def find_person
    @person = Person.find(params[:id])
  end
end
