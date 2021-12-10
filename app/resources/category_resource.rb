class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string
  attribute :chef_id, :integer

  # Direct associations

  has_many   :matches,
             foreign_key: :recipe_id

  has_many   :recipes

  belongs_to :chef

  # Indirect associations

  many_to_many :category_recipes,
               resource: RecipeResource

end
