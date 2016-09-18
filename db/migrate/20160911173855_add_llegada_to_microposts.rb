class AddLlegadaToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :fecha_llegada, :datetime
  end
end
