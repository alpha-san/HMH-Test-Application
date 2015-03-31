class CreateTestSteps < ActiveRecord::Migration
  def change
    create_table :test_steps do |t|
      t.string :title

      t.belongs_to :test_case
      t.belongs_to :test_result
      t.timestamps null: false
    end
  end
end
