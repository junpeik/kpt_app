class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :login_confirmation

  private
  def login_confirmation
    redirect_to new_session_path unless signed_in?
  end
end
