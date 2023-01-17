class ApplicationController < ActionController::Base
	# protect_from_forgery with: null_session
	TOKEN = "SITA_RAM".freeze
	before_action :verify_token
	def verify_token
		unless params[:token]==TOKEN
			return render json:{
				error: "Token error",
				message: "Customer not created!"
			}, status: :unprocessable_entity
		end
	end
end