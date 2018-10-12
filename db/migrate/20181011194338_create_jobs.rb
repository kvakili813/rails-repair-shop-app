class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :mechanic_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
