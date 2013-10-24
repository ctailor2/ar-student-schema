require_relative '../app/models/assignment'
require_relative '../app/models/student'
require_relative '../app/models/teacher'

module AssignmentsImporter
  def self.import
    Assignment.transaction do
      until Assignment.all.size == 100
        attribute_hash = {student_id: rand(1..Student.all.length), teacher_id: rand(1..Teacher.all.length)}
        student_teacher = Assignment.create!(attribute_hash)
      end
    end
  end
end

