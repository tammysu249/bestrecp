class AddRecipeReferenceToMatches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :matches, :categories, column: :recipe_id
    add_index :matches, :recipe_id
    change_column_null :matches, :recipe_id, false
  end
end
