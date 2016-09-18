class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.references :micropost, index: true, foreign_key: true
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
