class N1QLTest < CouchbaseOrm::Base
  attribute :name, type: String
  attribute :lastname, type: String
  enum rating: %i[awesome good okay bad], default: :okay
  attribute :country, type: String

  # Example 1: Custom query with specific rating values
  n1ql :by_custom_rating, emit_key: [:rating], query_fn: proc { |bucket, _values, options|
    cluster.query("SELECT raw meta().id FROM `#{bucket.name}` WHERE type = 'n1_ql_test' AND rating IN [1, 2] ORDER BY name ASC", options)
  }

  # Example 2: Simple query by name
  n1ql :by_name, emit_key: [:name]

  # Example 3: Simple query by lastname
  n1ql :by_lastname, emit_key: [:lastname]

  # Example 4: Custom query by country with parameter binding
  n1ql :by_country, emit_key: [:country], query_fn: proc { |bucket, values, options|
    cluster.query(
      "SELECT raw meta().id FROM `#{bucket.name}` WHERE type = 'n1_ql_test' AND country = $country ORDER BY name ASC",
      Couchbase::Options::Query(named_parameters: { country: values[0] })
    )
  }

  # Example 5: Simple query by rating
  n1ql :by_rating_emit, emit_key: :rating

  # Example 6: Custom query by rating with parameter binding
  n1ql :by_custom_rating_values, emit_key: [:rating], query_fn: proc { |bucket, values, options|
    cluster.query("SELECT raw meta().id FROM `#{bucket.name}` where type = 'n1_ql_test' AND rating IN #{quote(values[0])} ORDER BY name ASC", options)
  }

  # Example 7: Custom query by rating with custom ordering
  n1ql :by_rating_reverse, emit_key: :rating, custom_order: 'name DESC'

  # Example 8: Simple query by rating without including documents
  n1ql :by_rating_without_docs, emit_key: :rating, include_docs: false

  # Index definition for the rating attribute
  index_n1ql :rating
end
