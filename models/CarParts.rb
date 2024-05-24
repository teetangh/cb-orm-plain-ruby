# Define the Part nested document
class Part < CouchbaseOrm::NestedDocument
  attribute :name, :string
  attribute :manufacturer, :string
end

# Define the Car model with a nested Part document
class Car < CouchbaseOrm::Base
  attribute :make, :string
  attribute :model, :string
  attribute :year, :integer
  attribute :parts, :array, type: Part

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
end
