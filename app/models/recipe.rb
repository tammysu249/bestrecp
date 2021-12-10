class Recipe < ApplicationRecord
  # Direct associations

  has_many   :matches,
             :foreign_key => "category_id",
             :dependent => :destroy

  belongs_to :category

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipe_name
  end

end
