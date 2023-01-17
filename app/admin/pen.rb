ActiveAdmin.register Pen do
	permit_params :name, :color, :active, :price
end