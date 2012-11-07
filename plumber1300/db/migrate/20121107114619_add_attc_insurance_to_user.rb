class AddAttcInsuranceToUser < ActiveRecord::Migration
  def change
    add_column :users, :attInsurance, :integer

  end
end
