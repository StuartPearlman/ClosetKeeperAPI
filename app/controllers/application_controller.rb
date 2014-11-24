class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token
	before_action :authenticate

	protected
	def authenticate
		authenticate_token || render_unauthorized
	end

	def authenticate_token
		if request.headers['Authorization']
			token = request.headers['Authorization'].split(' ').last
		end
		@user = User.find_by(auth_token: token)
	end

	def render_unauthorized
		self.headers['WWW-Authenticate'] = 'Token realm="Application"'

		render json: 'Bad API Token', status: 401
	end
end
