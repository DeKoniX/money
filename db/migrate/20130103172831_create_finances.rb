class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.decimal :m, scale: 2
      t.text :desc

      t.timestamps
    end
  end
end
