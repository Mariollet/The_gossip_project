class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new,:edit,:destroy]

  def index 
    @gossip = Gossip.new
    @gossips = Gossip.all
  end

  def show
    puts params
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    u = User.last
    @gossip = Gossip.new(title: params[:gossip][:title],content: params[:gossip][:content],user: current_user,city_id: current_user.city_id)
    @gossips = Gossip.all
    if @gossip.save
      render "index"
    else
      render "new"
    end
  end
  
  def edit
    @gossip = Gossip.find(params[:id])
  endlsof -wni tcp:3000


  def update
    @users = User.all
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
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu veux commérer ? Connecte toi !"
      redirect_to new_session_path
    end
  end

  def gossip_params
    gossip_params = params.require(:gossip).permit(:title,:content)
  end

end