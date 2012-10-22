class AddInsuredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :insured, :integer, default: 1

  end
end
