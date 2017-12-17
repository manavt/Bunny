class UsersController < ApplicationController
  skip_before_action :verify_session, only: [:new, :create, :login_page, :sign_in, :facebook]
  def index
    # @users =  User.all
    @users =  User.paginate(:page => params[:page], :per_page => 5)
    # @mojo = {name: "Manav", address: "HSR"}
  end

  def new
    @user = User.new
    @user.build_image
  end
  def create
    @user = User.new(user_params)
    if @user.save(validate: false)
      SendEmailMailer.welcome_body(@user).deliver_now!
      redirect_to users_path
      flash[:notice] = "Hey, You are now the part of ECOM :)"
    else
      render :new
      flash[:notice] = "OOPS, Something went wrong"
    end

  end
  def edit
    @user = User.find params[:id]
  end
  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      redirect_to users_path
      flash[:notice] = "Hey, You have updated successfully"
    else
      render :edit
      flash[:notice] = "OOPS, Something went wrong"
    end
  end
  def show
    @user = User.find params[:id]
  end
  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
    flash[:notice] = "Hey, You have deleted successfully"
  end
  def sign_in
    user = User.authenticate(params[:email], params[:password])
    if user
       session[:user_id] = user.id
       redirect_to users_path
       flash[:notice] = "Successfully logged in!!!"
     else
       redirect_to root_path
       flash[:notice] = "Username or Password do not match"
    end
  end
  def logout
     session[:user_id] = nil
     redirect_to root_path
     flash[:notice] = "Logged out successfully!!!"
  end
  def facebook
    user = User.omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to products_path
  end
  protected
  def user_params
    params.require("user").permit!
  end
end
