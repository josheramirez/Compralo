class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.integer :precio
      t.integer :cantidad
      t.string :tipo

      t.timestamps null: false
    end
  end
end
