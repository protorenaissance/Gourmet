class UsersController < ApplicationController
  def signup
  end

  def signup_complete
		u=User.new
		u.username=params[:username]
		u.password=params[:password]
		if params[:password]!=params[:retype_password]
			flash[:alert]="Your password doesn't match with the confirmation!"
			redirect_to:back
		elsif !u.save
			flash[:alert]=u.errors.values.flatten.join(' ')
			redirect_to:back
		else
			flash[:alert]="Successfully Signed Up!"
			redirect_to "/"
		end
  end

  def login
  end

  def login_complete
  end

  def logout_complete
  end
end
