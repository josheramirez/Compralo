class AddEstadoToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :estado, :text
  end
end
