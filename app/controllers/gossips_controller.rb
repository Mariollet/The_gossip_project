class GossipsController < ApplicationController

  def index 
    @gossip = Gossip.new
    @gossips = Gossip.all
  end

  def show
    @user = User.find(params[:id])
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    u = User.last
    @gossip = Gossip.new(title: params[:gossip][:title],content: params[:gossip][:content],user: u,city_id: u.city.id)
    @gossips = Gossip.all
    if @gossip.save
      render "index"
    else
      render "new"
    end
  end
  
  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @gossips = Gossip.all
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      render "index"
    else
      render "edit"
    end
  end

  def destroy
    @gossips = Gossip.all
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def gossip_params
    gossip_params = params.require(:gossip).permit(:title,:content)
  end

end