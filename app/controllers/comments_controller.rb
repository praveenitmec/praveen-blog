class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if current_user
    if @comment.save
    	render json:{status:"OK", data: {'user': current_user.email,
                                       'comment': @comment}}
    else
    	render json:{status:"FAILS", errors:@comment.errors.full_messages}
    end 
	end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	render json:{status:"OK"}
  rescue Exception => e
    puts e
  	render json:{status:"FAILS"}
  end

	private
	  def comment_params
	  	params.require(:comment).permit(:body, :post_id)
	  end
end
