class CitiesController < ApplicationController

  def index
    @city = City.new
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @user = City.find(params[:id]).users
    @gossip = City.find(params[:id]).gossips
  end

end
