class TestStep < ActiveRecord::Base
  belongs_to :test_case
  belongs_to :test_result
end
