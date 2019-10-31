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
      @user = User.new(first_name: params[:user][:first_name],last_name: params[:user][:last_name],age: params[:user][:age],email: params[:user][:email],city_id: params[:user][:city_id],email: params[:user][:email],password: params[:user][:password],bio: params[:user][:bio])
      flash[:danger] = "La confirmation du mot de passe doit correspondre au mot de passe saisi précédemment."
      render "users/new"
    else
      @user = User.new(first_name: params[:user][:first_name],last_name: params[:user][:last_name],age: params[:user][:age],email: params[:user][:email],city_id: params[:user][:city_id],email: params[:user][:email],password: params[:user][:password],bio: params[:user][:bio])
      if @user.save
        if params[:user][:password] != params[:user][:confirm_password]
          render "users/new"
        end
        @users = User.all
        render "index"
      else
        render "users/new"
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    @gossips = @user.gossips
    @gossips.length.times do |i|
      @gossips[i].destroy
    end
    @user.destroy
    redirect_to users_path
  end

  private

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
