class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.boolean :status
      t.string :comment

      t.belongs_to :test_execution
      t.belongs_to :test_step
      t.timestamps null: false
    end
  end
end
