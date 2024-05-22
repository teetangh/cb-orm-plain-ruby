class Book < CouchbaseOrm::Base
  attribute :title, :string
  attribute :author, :string
  attribute :pages, :integer
  attribute :genre, :string
  attribute :email, :string

  validates_presence_of :title
  validates :author, presence: true
  validates :pages, numericality: { greater_than: 0 }
  validates :genre, inclusion: { in: %w[Fiction Non-Fiction] }
  # validates :title, uniqueness: true
  validates :author, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :pages, length: { maximum: 500 }
  validates :genre, exclusion: { in: %w[Science-Fiction] }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validate :custom_validation

  private

  def custom_validation
    puts 'Running custom validation...'
    if title&.include?('Funny')
      errors.add(:title, 'should not contain the word "Funny"')
    else
      # print the title
      puts "Title: #{title}"
      puts 'Custom validation passed'
    end
  end
end
