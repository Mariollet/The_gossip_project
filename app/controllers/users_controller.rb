class UsersController < ApplicationController

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
    c = City.find_by(name: params[:user][:city])
    if c == nil
      c = City.last
    end
    @user = User.new(first_name: params[:user][:first_name],last_name: params[:user][:last_name],age: params[:user][:age],email: params[:user][:email],city_id: c.id,email: params[:user][:email])
    @users = User.all
    if @user.save
      render "index"
    else
      render "new"
    end
  end

end
