require 'couchbase-orm'

CouchbaseOrm::Connection.config = {
    connection_string: "couchbase://localhost",
    username: "kaustav",
    password: "password",
    bucket: "travel-sample",
    logger: Logger.new(STDOUT),
    log_level: :debug,
    load_config: File.join(File.dirname(__FILE__), "..", "couchbase.yml")
}
