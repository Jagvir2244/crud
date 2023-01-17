class StudentsController < ApiController

	def index
		students = Student.all
		render json: {
			success: true,
			action: "index",
			students: students
		}
	end

	def show
		student = Student.find(params[:id]) rescue nil
		if student.present?
			render json: {
				success: true,
				action: "index",
				students: student
			}
		else
			render json: {
				success: false,
				action: "index",
				error: "Student not present",
				message: "Student not exist"
			}
		end
	end
end
