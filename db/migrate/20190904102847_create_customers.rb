class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.string :description
      t.boolean :blacklist

      t.timestamps
    end
  end
end
