class AddAtributosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numero_contacto, :sring
    add_column :users, :calle_envio, :string
    add_column :users, :numero_envio, :string
    add_column :users, :comuna_envio, :string
  end
end
