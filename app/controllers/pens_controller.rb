class PensController < ApplicationController
    protect_from_forgery with: :null_session

    def index
    	pens = Pen.all
    	render json:{
    		success: true,
			action: "index",
			pens: pens
    	}
    end

    def show
    	pen = Pen.find(params[:id]) rescue nil
    	if pen.present?
    		render json:{
    			success: true,
				action: "show",
    			pen: pen
    		}
    	else 
    		render json:{
    			error: "pen not exist",
    			message: "pen not exist"
    		}
    	end
    end 
     def create
     	pen = Pen.new(pen_params)
     	if pen.save
     		render json:{
     			pen: pen
     		}
     	else
     		render json:{
     			error: "pen not create",
     			message: "pen not create"
     		}
     	end
     end

     def update
     	pen = Pen.find(params[:id]) rescue nil
     	if pen.present?
     		pen.update(pen_params)
     		render json:{
     			pen: pen
     		}
     	else 
     		render json:{
     			error: "pen not exist",
     			message: "pen not exist"
     		}
     	end
     end
     def destroy
     	pen = Pen.find(params[:id]) rescue nil
     	if pen.present?
     		pen.destroy
     		render json:{
     			message: "pen deleted"
     		}
     	else
     		render json:{
     			error: "pen not exist",
     			message: "pen not exist"
     		}
     	end
     end
    private
    def pen_params
    	params.require(:pen).permit(:name, :color, :active, :price)
    end
end