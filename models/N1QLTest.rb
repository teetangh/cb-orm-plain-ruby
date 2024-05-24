class N1QLTest < CouchbaseOrm::Base
  attribute :name, type: String
  attribute :lastname, type: String
  enum rating: %i[awesome good okay bad], default: :okay

  n1ql :by_custom_rating, emit_key: [:rating], query_fn: proc { |bucket, _values, options|
    cluster.query("SELECT raw meta().id FROM `#{bucket.name}` WHERE type = 'n1_ql_test' AND rating IN [1, 2] ORDER BY name ASC", options)
  }

  n1ql :by_name, emit_key: [:name]

  n1ql :by_lastname, emit_key: [:lastname]

  n1ql :by_rating_emit, emit_key: :rating

  n1ql :by_custom_rating_values, emit_key: [:rating], query_fn: proc { |bucket, values, options|
  cluster.query("SELECT raw meta().id FROM `#{bucket.name}` where type = 'n1_ql_test' AND rating IN #{quote(values[0])} ORDER BY name ASC", options)
}
  n1ql :by_rating_reverse, emit_key: :rating, custom_order: 'name DESC'

  n1ql :by_rating_without_docs, emit_key: :rating, include_docs: false

  index_n1ql :rating
end
