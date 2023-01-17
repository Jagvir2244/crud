class KeyboardsController < ApplicationController
    protect_from_forgery with: :null_session
skip_before_action :verify_token, only: [:index]
	def index
		keyboars = Keyboard.all
		render json:{
			keyboars: keyboars
		}, status: :ok
	end
	def show
		keyboard = Keyboard.find(params[:id]) rescue nil
		if keyboard.present?
			render json:{
				keyboard: keyboard
			}
		else
			render json:{
				error: "keyboard not exist"
			}, status: :unprocessable_entity
		end
	end
	 def create
	 	keyboard = Keyboard.new(keyboard_params)
	 	if keyboard.save
	 		render json:{
	 			keyboard: keyboard
	 		}, status: :created
	 	else
	 		render json:{
	 			errors: keyboard.errors
	 		}, status: :unprocessable_entity
	 	end
	 end
	  def update
	  	keyboard = Keyboard.find(params[:id]) rescue nil
	  	if keyboard.present?
	  		keyboard.update(keyboard_params)
	  		render json:{
	  			keyboard: keyboard
	  		},status: :ok
	  	else
	  		render json:{
	  			errors: "keyboard.errors"
	  		}, status: :unprocessable_entity
	  	end
	  end
	  def destroy
	  	keyboard = Keyboard.find(params[:id]) rescue nil
	  	if keyboard.present?
	  		keyboard.destroy
	  		render json:{
	  			message: "keyboard deleted"
	  		}, status: :on
	  	else
	  		render json:{
	  			error: "keyboard not delete"
	  		}, status: :unprocessable_entity
	  	end
	  end

	  private
	  def keyboard_params
	  	params.require(:keyboard).permit(:brand, :price, :discount, :discription, :active, :color)
	  end

end
