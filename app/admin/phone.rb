ActiveAdmin.register Phone do
	permit_params :name, :color, :active, :price
end