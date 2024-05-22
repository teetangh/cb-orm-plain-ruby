# models/document.rb
class Document < CouchbaseOrm::Base
  attribute :title, :string
  attribute :content, :string

  before_create :before_create_callback
  after_create :after_create_callback
  before_save :before_save_callback
  after_save :after_save_callback
  before_update :before_update_callback
  after_update :after_update_callback
  before_destroy :before_destroy_callback
  after_destroy :after_destroy_callback

  private

  def before_create_callback
    puts "Running before_create callback for #{title}"
  end

  def after_create_callback
    puts "Running after_create callback for #{title}"
  end

  def before_save_callback
    puts "Running before_save callback for #{title}"
  end

  def after_save_callback
    puts "Running after_save callback for #{title}"
  end

  def before_update_callback
    puts "Running before_update callback for #{title}"
  end

  def after_update_callback
    puts "Running after_update callback for #{title}"
  end

  def before_destroy_callback
    puts "Running before_destroy callback for #{title}"
  end

  def after_destroy_callback
    puts "Running after_destroy callback for #{title}"
  end
end
