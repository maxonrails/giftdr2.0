class PersonsController < ApplicationController
  def index
    @people = Person.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
