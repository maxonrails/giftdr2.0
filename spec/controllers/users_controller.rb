require "rails_helper" 


RSpec.describe UsersController do

  render_views

  describe "GET index" do
    it "collects users into @users" do 
      user = User.create(name: "Johnny Karate", uid:"a", provider: "facebook")
      get :index
      expect(assigns(:users)).to eq([user]) 
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index 
    end
  end

  describe "GET show" do
  	it "renders the show template" do
  		user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      session[:user_id] = user.id 
  		get :show, id: user.id 
  		expect(response).to render_template :show 
  	end 
  end 

  describe "GET show" do
    it "renders the show template" do
      user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      get :show, id: user.id 
      # expect(response.body).to contain("Never forget another important event") 
      expect(response.body).to match /redirected/im
    end 
  end 

  describe "GET edit" do
    it "renders the show template" do
      user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      get :edit, id: user.id 
      # expect(response.body).to contain("Never forget another important event") 
      expect(response.body).to match /redirected/im 
    end 
  end 

  describe "GET edit" do
    it "renders the show template" do
      user = User.create(name: "Johnny Karate", uid: 1, provider: "facebook") 
      session[:user_id] = user.id 
      get :edit, id: user.id 
      expect(response).to render_template :edit 
    end 
  end 

  describe 'PATCH #update' do
	context "with valid attributes" do
		it "updates the contact in the database"
		it "redirects to the contact"
	end

	context "with invalid attributes" do
	 	it "does not update the contact"
	 	it "re-renders the :edit template"
	end
  end

  describe "POST create" do 
  	context "with valid attributes" do
	  	it "saves a new user"
	  	it "redirects to show page" 
	end  

  	context "with invalid attributes" do
  		it "doesn't save a new user"
  		it "re-renders the new template" 
  	end 
  end 

end    