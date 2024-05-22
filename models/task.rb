class Task < CouchbaseOrm::Base
  attribute :title, :string
  attribute :description, :string
  attribute :completed, :boolean, default: false
end
