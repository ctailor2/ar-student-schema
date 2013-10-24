require_relative '../../db/config'

class Teacher < ActiveRecord::Base
# implement your Teacher model here
  validates :email, :format => { :with => /\A.+@.+\..{2,}\z/, :message => 'Invalid email format.' }, :uniqueness => true
  has_and_belongs_to_many :students

end
