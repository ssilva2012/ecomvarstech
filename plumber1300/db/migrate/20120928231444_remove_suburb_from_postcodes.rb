class RemoveSuburbFromPostcodes < ActiveRecord::Migration
  def up
  	remove_column :postcodes, :subrub
  end

  def down
  end
end
