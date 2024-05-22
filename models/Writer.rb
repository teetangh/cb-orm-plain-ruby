class Writer < CouchbaseOrm::Base
  attribute :name, :string
  attribute :age, :integer
  attribute :country, :string
  attribute :email, :string
  attribute :active, :boolean

  n1ql :by_name, emit_key: :name
  n1ql :by_country, emit_key: :country
  index_n1ql :email

  validates_presence_of :name, :age, :country
end
