class AddValoresToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :cantidad_nueva, :integer
    add_column :microposts, :id_micropost, :integer
  end
end
