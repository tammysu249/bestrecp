class Category < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             :dependent => :nullify

  belongs_to :chef

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end

end
