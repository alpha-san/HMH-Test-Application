class CreateUseCases < ActiveRecord::Migration
  def change
    create_table :use_cases do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
