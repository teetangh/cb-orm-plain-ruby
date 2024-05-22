# Define the Bank model with an encrypted attribute
class Bank < CouchbaseOrm::Base
  attribute :name, :string
  attribute :account_number, :encrypted
end
