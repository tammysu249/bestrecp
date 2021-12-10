class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.integer :chef_id

      t.timestamps
    end
  end
end
