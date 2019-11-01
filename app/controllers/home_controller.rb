class HomeController < ApplicationController

  def welcome
    @gossips = Gossip.all
    @users = User.all
    if City.all.length == 0
      City.create(name: "Paris")
      City.create(name: "Montpellier")
      City.create(name: "Grenoble")
      City.create(name: "Avignon")
    end
  end

end
