class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string
  attribute :chef_id, :integer

  # Direct associations

  belongs_to :chef

  # Indirect associations

end
