class Employee < CouchbaseOrm::Base
  attribute :name, :string
  belongs_to :company
end
class Customer < CouchbaseOrm::Base
  attribute :name, :string
  belongs_to :company
end
class Company < CouchbaseOrm::Base
  attribute :name, :string
  has_many :employees, type: :n1ql
  has_many :customers, type: :n1ql
  self.strict_loading_by_default = true
end
