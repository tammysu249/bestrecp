class AddChefReferenceToCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :categories, :chefs
    add_index :categories, :chef_id
    change_column_null :categories, :chef_id, false
  end
end
