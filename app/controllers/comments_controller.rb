class CommentsController < ApplicationController
  before_action :authenticate_user, only: %i[new create edit update destroy]

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment.get_gossip
    else
      render :edit
    end
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])

    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.commentable = @gossip
    puts @comment

    if @comment.save
      redirect_to @gossip
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to @comment.get_gossip
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = 'Il est nécessaire de se connecter avant de créer un commentaire'
      redirect_to new_session_path
    end
  end
end
