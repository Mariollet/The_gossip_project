class HomeController < ApplicationController

  def welcome
    @gossips = Gossip.all
    @users = User.all
    if City.all.length == 4
      City.create(name: "Lyon")
      City.create(name: "Marseille")
    end
  end

end
