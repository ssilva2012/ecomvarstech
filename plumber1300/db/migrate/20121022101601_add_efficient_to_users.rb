class AddEfficientToUsers < ActiveRecord::Migration
  def change
    add_column :users, :efficient, :integer, default: 1

  end
end
