class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.decimal :m
      t.text :desc

      t.timestamps
    end
  end
end
