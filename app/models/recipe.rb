class Recipe < ApplicationRecord
  # Direct associations

  belongs_to :category

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_name
  end

end
