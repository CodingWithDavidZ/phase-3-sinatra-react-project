class Employees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :hire_date
      t.integer :employee_num
      t.integer :managers_id
      t.timestamps
    end
  end
end
