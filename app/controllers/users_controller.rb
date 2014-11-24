class UsersController < ApplicationController

	skip_before_action :authenticate, :only => [:create]

	def create
		user = User.new(user_params)
  	user.password = params[:password]
		if user.save
			render json: {auth_token: user.auth_token}, status: 201
		else 
			render json: user.errors, status: 422
		end
	end

	def destroy
		@user.destroy
		head 204
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end
end
