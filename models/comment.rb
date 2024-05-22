class Comment < CouchbaseOrm::Base
  attribute :title, :string
  attribute :author, :string
  attribute :category, :string
  attribute :ratings, :integer

  def self.by_author(author)
    where(author: author)
  end

  def self.highly_rated
    where('ratings > 3')
  end

  def self.in_category(category)
    where(category: category)
  end
end
