class AddAtributosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numero_contacto, :string
  end
end
