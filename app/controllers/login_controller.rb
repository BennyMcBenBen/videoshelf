class LoginController < ApplicationController
  
  before_filter :authorize, :except => [:login, :register]
  
  def index
    login
    render :action => 'login'
  end
  
  
  # just display the form and wait for user to
  # enter a name and password
  
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        if user.level == "admin"
          redirect_to(:controller => "admin", :action => "index")
        elsif user.level == "manager"
          redirect_to(:controller => "video", :action => "index")
        elsif user.level == "customer"
          redirect_to(:controller => "main", :action => "index")
        end
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => :login)
  end
  
  def register
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash[:notice] = "User #{@user.name} created"
      @user = User.new
      redirect_to(:action => :login)
    end
  end
  
end
