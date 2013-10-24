require 'rspec'
require_relative '../app/models/teacher'

describe Teacher, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
  end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :email => 'kreayshawn@oaklandhiphop.net',
    )
  end

  it "should accept valid info" do
    @teacher.should be_valid
  end

  it "shouldn't accept invalid emails" do
    ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
      @teacher.assign_attributes(:email => address)
      @teacher.should_not be_valid
    end
  end

  it "shouldn't allow two teachers with the same email" do
    another_teacher = Teacher.create!(
      :first_name => @teacher.first_name,
      :last_name => @teacher.last_name,
      :email => @teacher.email
    )
    @teacher.should_not be_valid
  end

end
