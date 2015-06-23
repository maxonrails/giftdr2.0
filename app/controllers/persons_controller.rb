class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
