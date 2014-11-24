class SessionsController < ApplicationController

	skip_before_action :authenticate, :only => [:create]

	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			user.set_auth_token
			user.save!
			render json: {auth_token: user.auth_token}, status: 200
		else
			render text: "No user with that email found", status: 422
		end
	end

	def destroy
		if @user
			@user.auth_token = ''
			@user.save!
			head 204
		else
			render text: "No user with that token found", status: 422
		end
	end
end
