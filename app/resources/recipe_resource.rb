class RecipeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recipe_name, :string
  attribute :category_id, :integer

  # Direct associations

  has_many   :matches,
             foreign_key: :category_id

  belongs_to :category

  # Indirect associations

  many_to_many :recipe_categories,
               resource: CategoryResource

end
