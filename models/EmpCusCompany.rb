
# class Employee < CouchbaseOrm::Base
#   attribute :name, :string
#   belongs_to :employable, polymorphic: true
# end

# class Customer < CouchbaseOrm::Base
#   attribute :name, :string
#   belongs_to :customizable, polymorphic: true
# end

# class Company < CouchbaseOrm::Base
#   attribute :name, :string
#   has_many :employees, as: :employable
#   has_many :customers, as: :customizable
# end
