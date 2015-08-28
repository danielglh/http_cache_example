class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.integer :status
      t.string :major
      t.integer :year

      t.timestamps null: false
    end
  end
end
