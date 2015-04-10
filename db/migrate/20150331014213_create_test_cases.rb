class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :id_description, null: false
      t.string :title

      t.belongs_to :use_case
      t.timestamps null: false
    end

    #add_index :test_cases, :id_description, unique: true

  end
end
