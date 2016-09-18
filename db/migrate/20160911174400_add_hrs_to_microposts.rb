class AddHrsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :hrs, :integer
  end
end
