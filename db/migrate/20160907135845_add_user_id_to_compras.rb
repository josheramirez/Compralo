class AddUserIdToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :user_id, :integer
  end
end
