# models/post.rb
class Post < CouchbaseOrm::Base
  attribute :title, :string, default: 'Untitled'
  attribute :content, :string
  attribute :published_at, :datetime

  alias_attribute :body, :content
end
