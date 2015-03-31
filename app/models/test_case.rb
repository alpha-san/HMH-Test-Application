class TestCase < ActiveRecord::Base
  belongs_to :use_case
  has_many :test_steps

  self.primary_key = 'id_description'
end
