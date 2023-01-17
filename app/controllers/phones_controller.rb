class PhonesController < ApplicationController
	    protect_from_forgery with: :null_session

	def index
		phones = Phone.all
		render json: {
			phones: phones
		}
	end
	 def show
	 	phone = Phone.find(params[:id]) rescue nil
	 	if phone.present?
	 		render json:{
	 			phone: phone
	 		}
	 	else
	 		render json:{
	 			error: "phone not exist",
	 			message: "phone not exist"
	 		}
	 	end
	 end
	 def create
	 	phone = Phone.new(phone_params)
	 	if phone.save
	 		render json:{
	 			phone: phone
	 		}
	 	else
	 		render json:{
	 			error: "phone not create",
	 			message: "phone not create"
	 		}
	 	end
	 end
	 def update
	 	phone = Phone.find(params[:id]) rescue nil
	 	if phone.present?
	 		phone.update(phone_params)
	 		render json:{
	 			phone: phone
	 		}
	 	else
	 		render json:{
	 			error: "phone not exist",
	 			message: "phome not exist"
	 		}
	 	end
	 end
	 def destroy
	 	phone = Phone.find(params[:id]) rescue nil
	 	if phone.present?
	 		phone.destroy
	 		render json:{
	 			message: "Phone deleted"
	 		}
	 	else
	 		render json:{
	 			error: "phone not exist",
	 			message: "phone not exist"
	 		}
	 	end
	 end


	 private
	 def phone_params
	 	params.require(:phone).permit(:name, :color, :active, :price)
	 end
end