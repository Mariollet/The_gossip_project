class SessionsController < ApplicationController

  def new
    @user = User.new
    if City.all.length == 0
      City.create(name: "Paris")
      City.create(name: "Montpellier")
      City.create(name: "Grenoble")
      City.create(name: "Avignon")
    end

  end

  def create
    @user = User.find_by(email: params[:email])
    puts params
    puts @user
  
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Login sucess'
      redirect_to welcome_path
  
    else
      flash.now[:danger] = 'Utilisateur non reconnu'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Sesion déconecté"
    redirect_to new_session_path
  end

end
