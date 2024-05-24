require_relative 'post'

# app/models/user.rb
class User < CouchbaseOrm::Base
  attribute :email, :string
  attribute :name, :string
  attribute :age, :integer
  attribute :height, :float
  attribute :is_active, :boolean
  attribute :birth_date, :date
  attribute :created_at, :datetime
  attribute :updated_at, :datetime
  attribute :appointment_time, :time
  attribute :hobbies, :array, type: :string
  attribute :metadata, type: Hash
  attribute :avatar, :binary

  attribute :created_at, :datetime
  attribute :updated_at, :datetime
end
