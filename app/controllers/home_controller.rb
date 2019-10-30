class HomeController < ApplicationController

  def welcome
    @gossips = Gossip.all
    @users = User.all
  end

end
