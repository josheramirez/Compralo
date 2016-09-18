class AddVentaToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :venta_cantidad, :integer
    add_column :microposts, :bodega_id, :integer
  end
end
