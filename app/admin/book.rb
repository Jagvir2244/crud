ActiveAdmin.register Book do
	permit_params :title, :auther, :publication_year
end

