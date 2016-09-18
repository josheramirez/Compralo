class AddCompraIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :compra_id, :integer
  end
end
