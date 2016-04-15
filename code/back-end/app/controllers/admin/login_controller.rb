class Admin::LoginController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :index
  def index
  	@errors = nil
  	if request.post?
  		@user_name = params[:email]
  		@password = params[:password]
  		
  		@user = User.find_by(user_name: @user_name)
  		if @user != nil and @user.password == @password
  			redirect_to '/admin/product'
  		else
  			@errors = 'Username / Password combination is incorrect. Please try again.'
  		end
  	end
  end
end