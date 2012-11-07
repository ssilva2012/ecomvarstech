class AddAttcPoliceToUser < ActiveRecord::Migration
  def change
    add_column :users, :attPolice, :integer

  end
end
