# models/author.rb
class Author < CouchbaseOrm::Base
  attribute :name, :string
  attribute :age, :integer
  attribute :active, :boolean, default: true

  validates :name, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18 }

  # scope :isactive, -> { where(active: true) }
  # scope :adults, -> { where('age >= ?', 18) }
end
