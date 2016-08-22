class AddTipoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :comprador, :boolean
    add_column :users, :vendedor, :boolean
  end
end
