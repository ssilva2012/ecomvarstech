class AddHowFindToUsers < ActiveRecord::Migration
  def change
    add_column :users, :howFind, :string

  end
end
