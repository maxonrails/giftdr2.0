class PersonsController < ApplicationController
  before_action :find_person, only:[:show]
  def index
    @persons = Person.all
  end

  def show
  end

  def new
  end

  def edit
  end
private
  def find_person
    @person = Person.find(params[:id])
  end
end
