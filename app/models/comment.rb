class Comment < ActiveRecord::Base
	belongs_to:post
	belongs_to:user
	validates:content,:presence=>{:message=>"You should input a content"}
end
