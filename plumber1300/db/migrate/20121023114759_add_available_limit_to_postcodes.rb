class AddAvailableLimitToPostcodes < ActiveRecord::Migration
  def change
    add_column :postcodes, :availableLimit, :integer

  end
end
