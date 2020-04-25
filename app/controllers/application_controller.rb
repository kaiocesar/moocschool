class ApplicationController < ActionController::API
  # include ActionController::RequestForgeryProtection
  before_action :authenticate_user!
  
  # protect_from_forgery with: :null_session
  # protect_from_forgery unless: -> { request.format.json? }
end
