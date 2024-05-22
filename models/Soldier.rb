# Define the Soldier model with the status enum
class Soldier < CouchbaseOrm::Base
  enum status: [:active, :inactive, :retired], default: :active

  attribute :name, :string
end
