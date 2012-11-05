class AddAvailableColumnToExpressIntersts < ActiveRecord::Migration
  def change
    add_column :express_intersts, :available, :string

  end
end
