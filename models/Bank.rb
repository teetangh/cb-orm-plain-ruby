# Define the Bank model with an encrypted attribute
class Bank < CouchbaseOrm::Base
  attribute :name, :string
  attribute :account_number, :encrypted
  attribute :routing_number, :encrypted, alg: "3DES"
end
