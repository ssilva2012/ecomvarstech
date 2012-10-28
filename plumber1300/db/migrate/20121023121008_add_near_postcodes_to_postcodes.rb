class AddNearPostcodesToPostcodes < ActiveRecord::Migration
  def change
    add_column :postcodes, :nearPostcodes, :string

  end
end
