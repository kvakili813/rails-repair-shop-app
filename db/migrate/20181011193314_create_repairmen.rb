class CreateRepairmen < ActiveRecord::Migration[5.2]
  def change
    create_table :repairmen do |t|
      t.string :name
      t.integer :uid, limit: 10

      t.timestamps null: false
    end
  end
end
