class LikesController < ApplicationController
    before_action :set_likes

    def create
        if @likeable.likes.count > 0 && @likeable.liked_by?(current_user)
         @like = Like.find_by(likeable_id: @likeable.id, user: current_user)
         @like.destroy
         else
            @like = @likeable.likes.new(user: current_user)
            @like.save    
        end
    end

    private
    def set_likes
      @likeable = params[:likeable_type].constantize.find(params[:likeable_id])  
    end
end