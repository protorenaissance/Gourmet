class FoodsController < ApplicationController
	before_action:login_check
	skip_before_action:login_check,:only=>[:posts,:posts_category,:show]
  def posts
		@posts=Post.all
  end

  def posts_category
		case params[:category]
			when "korean"
				@category="Korean"
			when "japanese"
				@category="Japanese"
			when "chinese"
				@category="Chinese"
			when "western"
				@category="Western"
		end
		@posts=Post.where(category:@category)
  end

  def show
		@post=Post.find(params[:id])
		@comment_writer=User.where(id:session[:user_id])[0]
  end

  def write
  end

  def write_complete
		post=Post.new
		post.user_id=session[:user_id]
		post.category=params[:post_category]
		post.title=params[:post_title]
		post.content=params[:post_content]
		if post.save
			flash[:alert]="Successfully Saved!"
			redirect_to "/foods/show/#{post.id}"
		else
			flash[:alert]=post.errors.values.flatten.join(' ')
			redirect_to:back
		end
	end

  def edit
		if session[:user_id]!=Post.find(params[:id]).user.id
			flash[:alert]="This post is other's."
			redirect_to:back
		else
			@post=Post.find(params[:id])
		end
  end

  def edit_complete
		post=Post.find(params[:id])
		post.category=params[:post_category]
		post.title=params[:post_title]
		post.content=params[:post_content]
		if post.save
			flash[:alert]="Successfully Edited!"
			redirect_to "/foods/show/#{post.id}"
		else
			flash[:alert]=post.errors.values.flatten.join(' ')
			redirect_to:back
		end
  end

  def delete_complete
		if session[:user_id]!=Post.find(params[:id]).user.id
			flash[:alert]="You can't delete other's"
			redirect_to:back
		else
			post=Post.find(params[:id])
			post.destroy
			flash[:alert]="Successfully Deleted!"
			redirect_to "/"
		end
  end
	def write_comment_complete
		comment=Comment.new
		comment.user_id=session[:user_id]
		comment.post_id=params[:post_id]
		comment.content=params[:comment_content]
		comment.save
		flash[:alert]="Made a new comment"
		redirect_to "/foods/show/#{comment.post_id}"
	end
	def delete_comment_complete
		if session[:user_id]!=Comment.find(params[:id]).user.id
			flash[:alert]="You cannot delete other's comments"
			redirect_to:back
		else
			comment=Comment.find(params[:id])
			comment.destroy
			flash[:alert]="Successfully deleted!"
			redirect_to "/foods/show/#{comment.post_id}"
		end
	end
end
