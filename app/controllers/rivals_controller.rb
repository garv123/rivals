class RivalsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def getLatestDate



	end

	def login
		contact_number = params[:phone]
		password = params[:password]
		user = User.find_by(contact_number:contact_number)
		if user && user.authenticate(password)
			api_key= ApiKey.create!
			api_key.update(:user_id=>user.id)
			render :json => {api_key:api_key[:access_token],phone:user.contact_number}
		else
			render :json => {status:500,message:"Invalid username or password"}
		end

	end

	def signup
		mobile_number = params[:phone]
		password = params[:password]
		if User.create(contact_number:mobile_number,password:password,password_confirmation:password)
			render :json => {status:200,message:"User has been signed up"}
		else
			render :json => {status:500,message:"Cannot sign up"}
		end
	end
end
