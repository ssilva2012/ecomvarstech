class AddResultsColumnToExpressIntersts < ActiveRecord::Migration
  def change
    add_column :express_intersts, :results, :string

  end
end
