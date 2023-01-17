ActiveAdmin.register Student do
	permit_params :first_name, :last_name, :roll_no,
	:phone, :email, :active, :class_name
end