class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.integer :m
      t.text :desc

      t.timestamps
    end
  end
end
