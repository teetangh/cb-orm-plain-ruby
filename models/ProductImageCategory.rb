# # app/models/image.rb
# class Image < CouchbaseOrm::Base
#   attribute :url, :string
#   attribute :imageable_id, :string
#   attribute :imageable_type, :string

#   belongs_to :imageable, polymorphic: true
# end

# # app/models/product.rb
# class Product < CouchbaseOrm::Base
#   attribute :name, :string
#   attribute :price, :float

#   has_many :images, as: :imageable, dependent: :destroy, autosave: true
# end

# # app/models/category.rb
# class Category < CouchbaseOrm::Base
#   attribute :name, :string

#   has_many :images, as: :imageable, dependent: :destroy, autosave: true
# end
