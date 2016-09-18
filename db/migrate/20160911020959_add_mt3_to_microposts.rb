class AddMt3ToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :mt3, :integer
  end
end
