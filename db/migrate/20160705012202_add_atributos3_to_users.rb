class AddAtributos3ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :numero_envio, :string
  end
end
