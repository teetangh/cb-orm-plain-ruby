class Publisher < CouchbaseOrm::Base
  attribute :name, :string
  has_and_belongs_to_many :magazines, join_class: 'PublishersMagazines'

  validates :name, presence: true
end

class Magazine < CouchbaseOrm::Base
  attribute :title, :string
  attribute :genre, :string
  has_and_belongs_to_many :publishers, join_class: 'PublishersMagazines'

  validates :title, presence: true
  validates :genre, presence: true
end

class PublishersMagazines < CouchbaseOrm::Base
  attribute :publisher_id, :string
  attribute :magazine_id, :string

  validates :publisher_id, presence: true
  validates :magazine_id, presence: true
end
