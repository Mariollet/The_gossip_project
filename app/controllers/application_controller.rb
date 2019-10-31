class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user

    if User.find_by(id: session[:user_id]) != nil
      return User.find_by(id: session[:user_id])
    else
      return "Non connecté"
    end

  end
  
end
