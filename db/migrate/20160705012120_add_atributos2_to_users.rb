class AddAtributos2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :calle_envio, :string
  end
end
