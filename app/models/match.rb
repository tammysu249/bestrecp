class Match < ApplicationRecord
  # Direct associations

  belongs_to :category,
             class_name: "Recipe"

  belongs_to :recipe,
             class_name: "Category"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end
end
