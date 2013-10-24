require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateAssignments < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :assignments do |t|
      t.belongs_to :student
      t.belongs_to :teacher
    end
  end
  
end


