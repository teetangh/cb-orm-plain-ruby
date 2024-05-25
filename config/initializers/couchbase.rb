require 'couchbase-orm'

CouchbaseOrm::Connection.config = {
    connection_string: "couchbase://localhost",
    username: "kaustav",
    password: "password",
    bucket: "travel-sample",
    load_config: File.join(File.dirname(__FILE__), "..", "couchbase.yml")
}
