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

ActiveRecord::Schema.define(:version => 20110219025105) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "city_id"
    t.integer  "area_id"
    t.integer  "street_id"
    t.string   "address_desc"
    t.string   "contact"
    t.text     "about"
    t.integer  "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "price"
    t.integer  "price_return"
    t.text     "price_intro"
    t.integer  "recommand"
    t.string   "weblink"
    t.integer  "form"
    t.integer  "identity"
    t.string   "reserve_intro"
    t.integer  "reserve_num"
    t.integer  "group_id"
    t.integer  "aptitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_person"
    t.float    "lat",            :limit => 20
    t.float    "lng",            :limit => 20
    t.integer  "site_id"
    t.string   "site_code",      :limit => 20
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "parent_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.text     "content"
    t.integer  "comment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.text     "description"
    t.string   "contact"
    t.string   "phone"
    t.integer  "level"
    t.string   "real_name"
    t.text     "purpose"
    t.integer  "authorize"
    t.string   "shorter"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.string   "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "involvements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locales", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "short_code"
    t.string   "type"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lng",        :limit => 20
    t.float    "lat",        :limit => 20
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "template_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pays", :force => true do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persistent_logins", :force => true do |t|
    t.string  "uid",     :null => false
    t.integer "user_id", :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", :force => true do |t|
    t.integer  "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "encrypted_password"
    t.string   "real_name"
    t.string   "email"
    t.integer  "city_id"
    t.integer  "area_id"
    t.integer  "street_id"
    t.string   "address_desc"
    t.integer  "gender"
    t.date     "birthday"
    t.integer  "status"
    t.string   "activate_code"
    t.datetime "last_login_at"
    t.integer  "level"
    t.string   "company"
    t.string   "department"
    t.string   "job"
    t.integer  "industry_id"
    t.text     "about_me"
    t.integer  "mianzi"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
