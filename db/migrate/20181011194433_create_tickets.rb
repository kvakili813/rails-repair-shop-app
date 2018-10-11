class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :description
      t.integer :price
      t.intefer :job_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
