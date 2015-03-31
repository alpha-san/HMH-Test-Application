class TestExecution < ActiveRecord::Base
  #attr_accessor :date
  has_many :test_results
  belongs_to :test_execution
end
