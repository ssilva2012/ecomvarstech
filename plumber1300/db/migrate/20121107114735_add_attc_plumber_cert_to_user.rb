class AddAttcPlumberCertToUser < ActiveRecord::Migration
  def change
    add_column :users, :attPlumberCert, :integer

  end
end
