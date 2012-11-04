class CreateFeedbackShorts < ActiveRecord::Migration
  def change
    create_table :feedback_shorts do |t|
      t.string :qut1
      t.string :qut2
      t.string :qut3
      t.string :qut4
      t.string :qut5
      t.string :qut6
      t.string :qut7
      t.string :qut8
      t.string :qut9
      t.string :qut10
      t.string :qut11
      t.string :custName
      t.string :custAddress
      t.string :jobPostcode
      t.text :comment

      t.timestamps
    end
  end
end
