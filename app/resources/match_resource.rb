class MatchResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_id, :integer
  attribute :recipe_id, :integer

  # Direct associations

  belongs_to :category,
             resource: RecipeResource

  belongs_to :recipe,
             resource: CategoryResource

  # Indirect associations

end
