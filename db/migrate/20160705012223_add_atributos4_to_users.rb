class AddAtributos4ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :comuna_envio, :string
  end
end
