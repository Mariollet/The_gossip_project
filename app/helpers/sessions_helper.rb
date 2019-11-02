module SessionsHelper

  def current_user

    if User.find_by(id: session[:user_id]) != nil
      return User.find_by(id: session[:user_id])
    else
      return nil
    end

  end

end
