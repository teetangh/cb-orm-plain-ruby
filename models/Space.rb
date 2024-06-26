# Define the Space model
class Space < CouchbaseOrm::Base
  attribute :name, type: String
  attribute :description, type: String
  attribute :created_at, type: Time

  view :by_name, emit_key: :name
  view :by_created_at,
    map: %{
      function(doc) {
        if (doc.type === "space") {
          emit(doc.created_at, null);
        }
      }
    }
end

# Define the Spaceship model
class Spaceship < CouchbaseOrm::Base
  attribute :name, type: String
  attribute :model, type: String
  attribute :created_at, type: Time
  attribute :space_id, type: String

  view :by_model, emit_key: :model
  view :by_space_id_and_created_at,
    map: %{
      function(doc) {
        if (doc.type === "spaceship") {
          emit([doc.space_id, doc.created_at], null);
        }
      }
    }
end

# Define the Astronaut model
class Astronaut < CouchbaseOrm::Base
  attribute :name, type: String
  attribute :age, type: Integer
  attribute :specialty, type: String
  attribute :spaceship_id, type: String

  # view :by_spaceship_id, emit_key: :spaceship_id
  view :by_specialty, emit_key: :specialty
  view :by_age,
    map: %{
      function(doc) {
        if (doc.type === "astronaut") {
          emit(doc.age, null);
        }
      }
    }
end

# Add associations after all models are defined
Space.class_eval do
  has_many :spaceships, foreign_key: :space_id, view_name: :by_space_foreign_key
end

Spaceship.class_eval do
  belongs_to :space, foreign_key: :space_id
  has_many :astronauts, foreign_key: :spaceship_id
end

Astronaut.class_eval do
  belongs_to :spaceship, foreign_key: :spaceship_id
end
