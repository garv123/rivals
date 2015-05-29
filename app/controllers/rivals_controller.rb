class RivalsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def getLatestDate

	end

	def login
		contact_number = params[:phone]
		password = params[:password]
		user = User.find_by(contact_number:contact_number)
		if user.authenticate(password)

		else
			render :json => {status:500,message:"Invalid username or password"}
		end

	end

	def signup
		mobile_number = params[:phone]
		password = params[:password]
		if User.create(contact_number:mobile_number,password_digest:password)
			render :json => {status:200,message:"User has been signed up"}
		else
			render :json => {status:500,message:"Cannot sign up"}
		end
	end
end
