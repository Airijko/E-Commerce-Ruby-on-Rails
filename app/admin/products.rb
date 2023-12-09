ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :brand, :category_id, :image

  form do |f|
  f.semantic_errors
  f.inputs do
    f.input :name
    f.input :description
    f.input :price
    f.input :stock_quantity
    f.input :brand
    f.input :category_id
    f.input :image, as: :file
  end
  f.actions
  end
end
