class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :category_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
