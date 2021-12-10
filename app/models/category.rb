class Category < ApplicationRecord
  # Direct associations

  belongs_to :chef

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end

end
