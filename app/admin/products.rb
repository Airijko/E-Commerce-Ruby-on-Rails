ActiveAdmin.register Product do

  permit_params :name, :description, :price, :stock_quantity, :brand, :image, :category_id
  
end
