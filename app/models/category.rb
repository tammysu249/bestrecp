class Category < ApplicationRecord
  # Direct associations

  has_many   :matches,
             :foreign_key => "recipe_id",
             :dependent => :destroy

  has_many   :recipes,
             :dependent => :nullify

  belongs_to :chef

  # Indirect associations

  has_many   :category_recipes,
             :through => :matches,
             :source => :category

  # Validations

  # Scopes

  def to_s
    category_name
  end

end
