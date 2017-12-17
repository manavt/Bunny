class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :verify_session, unless: Proc.new {|c| request.format.symbol == :json or request.format.symbol == :xml}
  def verify_session
    if session[:user_id].blank?
      redirect_to root_path
    end
  end
  def get_current_user
    @user = User.find_by(id: session[:user_id]) unless session[:user_id].blank?
  end
  helper_method :current_user
  def current_user
     @user = User.find_by(id: session[:user_id])
  end
end
