# Define the Factory model
class Factory < CouchbaseOrm::Base
  attribute :name, type: String
  attribute :location, type: String
  attribute :established_year, type: Integer
  attribute :active, type: Boolean

  view :by_name, emit_key: :name
  view :by_established_year, emit_key: :established_year
  view :by_active, emit_key: :active

  index_view :location

  view :by_name_and_location,
    map: %{
      function(doc) {
        if (doc.type === "factory") {
          emit([doc.name, doc.location], null);
        }
      }
    }

  view :by_established_year_range,
    map: %{
      function(doc) {
        if (doc.type === "factory" && doc.established_year) {
          emit(doc.established_year, null);
        }
      }
    }
end
