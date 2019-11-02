class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def index
  end

  def create
    @users = User.all
    @user = current_user
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(user: @user, gossip: @gossip, content: params[:content])
        puts "%" * 80
    puts @comment.inspect
    puts "%" * 80
    if @comment.save
      flash[:success] = "You created a Comment!"
      redirect_to gossip_path(@gossip.id)
    else
      flash.now[:danger] = "A problem occured my friend."
      render gossip_path(@gossip.id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      flash[:success] = "You updated a Comment!"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:danger] = "A problem occured my friend."
      render edit_gossip_comment_path(@gossip.id, @comment.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "You deleted a Comment!"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:danger] = "A problem occured my friend."
      render edit_gossip_comment_path
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Tu veux commérer ? Connecte toi !"
      redirect_to new_session_path
    end
  end

end
