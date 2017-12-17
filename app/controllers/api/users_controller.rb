class Api::UsersController < ApplicationController
  before_action :verify_token, only: :index
  def index
   @users = User.all
   render json: @users
  end

  def v1authentication
    return render json: {message: "Please give user name and password"} if params[:email].blank?
    user = User.authenticate(params[:email], params[:password])
    if user and !user.access_token.nil?
        render json: {access_token: user.access_token}
      elsif user and  user.access_token.nil?
        user.access_token =  SecureRandom.urlsafe_base64(nil, false)
        user.save
        render json: {access_token: user.access_token}
      else
        render json: {message: "User name and password do not match"}
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
      # redirect_to users_path
      # flash[:notice] = "Hey, You are now the part of ECOM :)"
    else
       render json: {message: "soemthing went wrong"}
      # flash[:notice] = "OOPS, Something went wrong"
    end

  end
  def verify_token
    user = User.find_by(access_token: request.env["HTTP_ACCESS_TOKEN"])
    if !user.present?
       render json: {message: "Please pass a valid token"}
     # else
     #   render json: {message: "pass the token and do get the token by calling auth function"}
    end
  end
  protected
  def user_params
    params.permit("name", "email", "password", "confirm_password", "mobile_no")
  end
end
