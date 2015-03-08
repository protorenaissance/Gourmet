class User < ActiveRecord::Base
	has_many:posts
	has_many:comments
	validates:username,:presence=>{:message=>"You should input ID"}
	validates:username,:uniqueness=>{:case_sensitive=>false,:message=>"There is already one"}
	validates:password,:length=>{:minimum=>6,:too_short=>"At least 6 characters long"}
end
