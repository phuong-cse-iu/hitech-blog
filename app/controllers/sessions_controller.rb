class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # if user meaning if were found
    if user && user.authenticate(params[:session][:password])
    	#create session with user_id to simulate user logged in 
      session[:user_id] = user.id
      flash[:success] = " You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There were something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end


end
