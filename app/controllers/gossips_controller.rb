class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossips = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    u = User.first
    @gossip = Gossip.new(title: params[:title],content: params[:content],user: u)

    if @gossip.save
      redirect_to "/"
    else
      render "new"
    end
  end
  
end