class FoodsController < ApplicationController
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
  end

  def write
  end

  def write_complete
  end

  def edit
  end

  def edit_complete
  end

  def delete_complete
  end
end
