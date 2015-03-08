class Post < ActiveRecord::Base
	belongs_to:user
	has_many:comments
	validates:category,:inclusion=>{:in=>["Korean","Japanese","Chinese","Western"],:message=>"Pick one between Korean, Chinese, Japanese, Western"}
	validates:title,:presence=>{:message=>"You should input a title"}
end
