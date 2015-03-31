class TestResult < ActiveRecord::Base
  belongs_to :test_execution
  belongs_to :test_step
end
