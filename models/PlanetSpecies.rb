class Planet < CouchbaseOrm::Base
  attribute :name, :string
  has_many :species, type: :n1ql, dependent: :destroy, autosave: true
end

class Species < CouchbaseOrm::Base
  attribute :name, :string
  belongs_to :planet
end
