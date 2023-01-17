class BegsController < ApplicationController
    protect_from_forgery with: :null_session

	def index
		begs = Beg.all
		render json:{
			begs:begs
		}
	end
	def show
		beg = Beg.find(params[:id]) rescue nil
		if beg.present?
			render json:{
				beg:beg
			}
		else
			render json:{
				error: "beg not exist",
				message: "beg not exist"
			}
		end
	end
	def create
		beg = Beg.new(beg_params)
		if beg.save
			render json:{
				beg: beg
			}
		else
			render json:{
				error: "beg not create"
			}
		end
	end
	 def update
	 	beg = Beg.find(params[:id]) rescue nil
	 	if beg.present?
	 		beg.update(beg_params)
	 		render json:{
	 			beg: beg
	 		}
	 	else 
	 		render json:{
	 			error: "beg not update"
	 		}
	 	end
	 end
	 def destroy
	 	beg = Beg.find(params[:id]) rescue nil
	 	if beg.present?
	 		beg.destroy
	 		render json:{
	 			message: "beg deleted"
	 		}
	 	else
	 		render json:{
	 			error: "beg not delete"
	 		}
	 	end
	 end



	 private
	 def beg_params
	 	params.require(:beg).permit(:brand, :color, :price, :active, :size)
	 end

end
