# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121024111637) do

  create_table "feedbacks", :force => true do |t|
    t.string   "custName"
    t.string   "custAddress"
    t.string   "custSuburb"
    t.string   "jobPostcode"
    t.integer  "quality",         :default => 3
    t.integer  "value",           :default => 3
    t.integer  "punctuality",     :default => 3
    t.integer  "workStyle",       :default => 3
    t.integer  "professionalism", :default => 3
    t.string   "comments"
    t.date     "jobDate"
    t.string   "plumberInfo"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "postcode_suburbs", :force => true do |t|
    t.integer  "postcode"
    t.string   "suburb"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "postcodes", :force => true do |t|
    t.integer  "postcode"
    t.integer  "isAvailable"
    t.integer  "maxLimit"
    t.decimal  "price",          :precision => 8, :scale => 2
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "availableLimit"
    t.string   "nearPostcodes"
  end

  create_table "products", :force => true do |t|
    t.string   "productCode"
    t.string   "name"
    t.string   "uom"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "supplierCode"
    t.string   "name"
    t.integer  "enabled"
    t.string   "address1"
    t.string   "address2"
    t.string   "email"
    t.string   "suburb"
    t.string   "postCode"
    t.string   "regNo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "userType",        :default => "USER"
    t.integer  "remember",        :default => 0
    t.integer  "enabled",         :default => 1
    t.integer  "reset",           :default => 0
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "password_digest"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "title"
    t.string   "company"
    t.string   "address"
    t.string   "state"
    t.string   "postcode"
    t.string   "officePhone"
    t.string   "mobile"
    t.integer  "licensed",        :default => 1
    t.integer  "insured",         :default => 1
    t.integer  "efficient",       :default => 1
    t.string   "howFind"
  end

end
