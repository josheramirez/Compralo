class AddMt2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mt2, :integer
  end
end
