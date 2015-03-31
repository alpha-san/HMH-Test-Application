class CreateTestExecutions < ActiveRecord::Migration
  def change
    create_table :test_executions do |t|
      t.datetime :date

      t.belongs_to :test_result
      t.timestamps null: false
    end
  end
end
