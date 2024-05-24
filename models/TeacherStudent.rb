class Teacher < CouchbaseOrm::Base
  attribute :name, :string
  attribute :subject, :string

  has_many :students, class_name: 'Student', foreign_key: :teacher_id, type: :n1ql, dependent: :destroy

  validates_presence_of :name, :subject
end
class Student < CouchbaseOrm::Base
  attribute :name, :string
  attribute :grade, :integer
  attribute :teacher_id, :string

  belongs_to :teacher, class_name: 'Teacher', foreign_key: :teacher_id

  validates_presence_of :name, :grade, :teacher_id
end
