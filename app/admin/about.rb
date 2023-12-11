ActiveAdmin.register About do
 permit_params :title, :content, :created_at

 form do |f|
   f.inputs do
     f.input :title
     f.input :content, as: :text
     f.input :created_at
   end
   f.actions
 end
end
