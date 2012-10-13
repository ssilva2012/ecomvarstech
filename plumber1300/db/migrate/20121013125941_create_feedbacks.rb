class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :custName
      t.string :custAddress
      t.string :custSuburb
      t.string :jobPostcode
      t.integer :quality, default: 3
      t.integer :value, default: 3
      t.integer :punctuality, default: 3
      t.integer :workStyle, default: 3
      t.integer :professionalism, default: 3
      t.string :comments
      t.date :jobDate
      t.string :plumberInfo

      t.timestamps
    end
  end
end
