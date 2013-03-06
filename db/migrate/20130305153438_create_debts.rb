class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :m
      t.text :desc
      t.references :person

      t.timestamps
    end
  end
end
