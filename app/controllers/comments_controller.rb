class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet
  def create
    @comment = @tweet.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format| 
      if @comment.save
        format.turbo_stream
        else
          format.html {redirect_to tweet_path(@tweet), alert: "reply could not created"}
      end
    end
  end
  def destroy
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy
    respond_to do |format| 
    format.turbo_stream
    format.html {redirect_to tweet_path(@tweet), notice: "comment was deleted"}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end