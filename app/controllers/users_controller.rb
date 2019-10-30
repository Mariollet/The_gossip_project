class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @gossips = User.find(params[:id]).gossips
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name],last_name: params[:last_name])

    if @user.save
      redirect_to "/"
    else
      render "new"
    end
  end

end
