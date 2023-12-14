class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :products, :category_id
      add_reference :products, :category, foreign_key: true
    end
  end
end
