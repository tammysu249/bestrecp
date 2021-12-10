class AddCategoryReferenceToMatches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :matches, :recipes, column: :category_id
    add_index :matches, :category_id
    change_column_null :matches, :category_id, false
  end
end
