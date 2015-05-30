class RivalsController < ApplicationController
	skip_before_action :verify_authenticity_token


	def getLatestDate
		api_key = ApiKey.find_by_access_token(params[:api_key])

    	if api_key == nil
      		render :json => {status: 400,message:"Unauthorized"}
    	else
      		user_id= api_key['user_id']
      		user = User.find(user_id)
			message=user.messages.order(:message_date).first
			if message.nil?
				render :json => {status:500,message:"no message "}
			else
				render :json => {status:200,datetime:message[:message_date]}
			end
    	end


	end

	def create_messages
		api_key = ApiKey.find_by_access_token(params[:api_key])
		if api_key == nil
      		render :json => {status: 400,message:"Unauthorized"}
    	else
    		
    		user_id= api_key["user_id"]
      		user = User.find(user_id)
      		amount = params[:amount].to_i
			location= params[:location]
			sublocation=params[:sublocation]
			message_date=params[:message_date].to_datetime
			debugger
			merchant_id = params[:merchant_id]
			restaurant_name=params[:restaurant_name]
			message_date_id=params[:message_date][0..9].gsub('-', '').to_i
			message_time_id=params[:message_date][11..21].gsub(':','').to_i
			merchant=Merchant.find_by(merchant_code:merchant_id.to_i)
			bank_transaction=true
			if  params[:merchant_code].to_i==1
				bank_transaction=true
			else
				bank_transaction=false
			end
			debugger
			message=Message.create(amount:amount,location:location,sublocation:sublocation,message_date:message_date,message_date_id:message_date_id,message_time_id:message_time_id,bank_transaction:bank_transaction)
			merchant.messages<<message
			restaurant_id=nil
			Restaurant.all.each do |restaurant|
				if  restaurant.name.include?(restaurant_name) or  restaurant_name.include?(restaurant.name)
					restaurant_id=restaurant.id
					break
				end
			end
			if restaurant_id.nil?

			else
				restaurant=Restaurant.find(restaurant_id.to_i)
				restaurant.messages<<message
			end
			user.messages<<message
			render :json => {status: 200,message:"message saved"}
    	end





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
		if user=User.create(contact_number:mobile_number,password:password,password_confirmation:password)
			api_key= ApiKey.create!
			api_key.update(:user_id=>user.id)
			render :json => {status:200,api_key:api_key[:access_token]}
		else
			render :json => {status:500,message:"Cannot sign up"}
		end
	end
end
