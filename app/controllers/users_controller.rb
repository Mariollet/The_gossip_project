class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit,:destroy]

  def index
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @gossip = User.find(params[:id]).gossips
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:confirm_password]
      @user = user_new
      flash[:danger] = "La confirmation du mot de passe doit correspondre au mot de passe saisi précédemment."
      render "users/new"
    else
      @user = user_new
      if @user.save
        if params[:user][:password] != params[:user][:confirm_password]
          render "users/new"
        end
        @users = User.all
        session[:user_id] = @user.id
        render "index"
      else
        render "users/new"
      end
    end
  end
  
  def edit
    @user = current_user
  end

  def update
    @users = User.all
    @user = User.find(params[:id])
    @gossips = Gossip.all
    if params[:user][:password] != params[:user][:confirm_password]
      @user.update(gossip_params)
      flash[:danger] = "La confirmation du mot de passe doit correspondre au mot de passe saisi précédemment."
      render "edit"
    else
      if @user.update(gossip_params)
        render "index"
      else
        render "edit"
      end
    end
  end

  def destroy
    @user = current_user
    @gossips = @user.gossips
    @user.destroy
    current_user = nil
    redirect_to users_path
  end

  private

  def user_new
    User.new(first_name: params[:user][:first_name].capitalize,last_name: params[:user][:last_name].capitalize,age: params[:user][:age],city_id: params[:user][:city_id],email: params[:user][:email],password: params[:user][:password],bio: params[:user][:bio].capitalize)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu veux commérer ? Connecte toi !"
      redirect_to new_session_path
    end
  end

  def gossip_params
    user = params.require(:user).permit(:first_name,:last_name,:city_id,:password,:age,:bio)
  end

end
